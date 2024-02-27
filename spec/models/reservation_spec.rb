# frozen_string_literal: true

# == Schema Information
#
# Table name: reservations
#
#  id          :bigint           not null, primary key
#  returned_on :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :bigint           not null
#  user_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject(:reservation) { create(:reservation) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:book) }
  end

  describe 'validations' do
    it { expect(reservation).to be_valid }

    context 'when a reservation is finished in a past date' do
      it 'raise a validation error' do
        expect { create(:reservation, returned_on: Date.yesterday) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'returned_on cannot be revised' do
      let!(:reservation) { create(:reservation, :returned) }

      it 'raise a validation error' do
        expect { reservation.update!(created_at: Date.tomorrow) }
      end
    end

    context 'book_cannot_be_double_reserved' do
      let!(:book) { create(:book) }
      let!(:reservation) do
        create(:reservation, book:)
        book.reload
      end

      it 'raise a validation error' do
        expect { create(:reservation, book:) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'user cannot reserver multiple books' do
      let!(:user) { create(:user) }
      let!(:reservation) do
        create(:reservation, user:)
        user.reload
      end

      it 'raise a validation error' do
        expect { create(:reservation, user:) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
