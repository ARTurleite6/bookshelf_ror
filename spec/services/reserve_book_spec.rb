# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReserveBook do
  let(:book) { create(:book) }
  let(:user) { create(:user) }
  let!(:admin) { create(:user, is_admin: true) }
  let(:reserve_book) { described_class.new(book, user.id).perform }

  describe '#perform' do
    context 'when everything is correct, user and book fit criteria' do
      it 'should create reservation' do
        aggregate_failures do
          expect { reserve_book }.to change(Reservation, :count).by(1)
          expect(reserve_book.success?).to be_truthy
          expect(SendNewReservationEmailJob).to have_enqueued_sidekiq_job(admin.id, user.id, book.id)
        end
      end
    end

    context 'when user is already reading a book' do
      before do
        create(:reservation, user:)
      end

      it 'should not create a reservation' do
        aggregate_failures do
          expect { reserve_book }.not_to change(Reservation, :count)
          expect(reserve_book.success?).to be_falsey
          expect(*reserve_book.errors).to eq('You already have an ongoing reservation')
          expect(SendNewReservationEmailJob).not_to have_enqueued_sidekiq_job(any_args)
        end
      end
    end

    context 'when book is unavailable' do
      before do
        create(:reservation, book:)
      end

      it 'should not create a reservation' do
        aggregate_failures do
          book.reload
          expect { reserve_book }.not_to change(Reservation, :count)
          expect(reserve_book.success?).to be_falsey
          expect(*reserve_book.errors).to eq('This book is already reserved')
          expect(SendNewReservationEmailJob).not_to have_enqueued_sidekiq_job(any_args)
        end
      end
    end
  end
end
