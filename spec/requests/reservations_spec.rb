require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET #index' do
    context 'when user is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        create(:reservation, user:)
      end

      it 'returns the list of reservations of the user' do
        get reservations_path

        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('text/html; charset=utf-8')
          expect(response.body).to include(Reservation.find_by(user:).book.title)
        end
      end
    end

    context 'when user is logged out' do
      it 'it redirects to login page' do
        get reservations_path

        aggregate_failures do
          expect(response).to redirect_to(new_user_session_path)
          expect(response).to have_http_status(:found)
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'when user is logged in' do
      include_context 'with logged in user'

      context 'when reservation is active' do
        let(:reservation) { create(:reservation, user:) }

        it 'finishes reservation' do
          patch reservation_path(reservation)

          aggregate_failures do
            expect(reservation.reload.returned_on).not_to eq(nil)
            expect(response).to have_http_status(:found)
          end
        end
      end

      context 'when reservation is inactive' do
        let(:reservation) { create(:reservation, user:, returned_on: Date.tomorrow) }

        it 'raises an exception' do
          patch reservation_path(reservation)
          aggregate_failures do
            expect(response).to have_http_status(:not_found)
          end
        end
      end
    end

    context 'when user is logged out' do
      let(:reservation) { create(:reservation) }
      it 'redirects to log in' do
        patch reservation_path(reservation)
        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status(:found)
      end
    end
  end
end
