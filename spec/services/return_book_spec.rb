require 'rails_helper'

RSpec.describe ReturnBook do
  let!(:admin_user) { create(:user, is_admin: true) }
  let(:return_book) { described_class.new(reservation).perform }

  describe '#perform' do
    context 'on a active reservation' do
      let(:reservation) { create(:reservation) }

      it 'reservation is updated to have returned date' do
        return_book

        aggregate_failures do
          expect(return_book.success?).to be_truthy
          expect(return_book.reservation.returned_on).to eq(Date.today)
          expect(SendReturnEndingJob).to have_enqueued_sidekiq_job(admin_user.id, reservation.book.id,
                                                                   reservation.user.id)
        end
      end
    end
  end
end
