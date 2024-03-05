# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Books', type: %i[request system] do
  describe 'GET /index' do
    context 'when logged in' do
      include_context 'with logged in user'

      it 'returns existing book collection' do
        get books_path

        aggregate_failures do
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('text/html; charset=utf-8')
          Book.pluck(:title) do |title|
            expect(response.body).to have_content(title)
          end
        end
      end
    end

    context 'when logged out' do
      it 'redirects to login' do
        aggregate_failures do
          get books_path

          aggregate_failures do
            expect(response).to redirect_to(new_user_session_path)
            expect(response).to have_http_status(:found)
            expect(response.content_type).to eq('text/html; charset=utf-8')
          end
        end
      end
    end
  end

  describe '#POST create' do
    context 'with logged in' do
      include_context 'with logged in user'

      context 'with valid book params' do
        let(:params) do
          {
            book: {
              title: Faker::Book.title,
              genre: Book.genres.keys.sample,
              description: Faker::Quote.matz,
              cover_url: Faker::Internet.url
            }
          }
        end
        it 'creates a new book and redirects' do
          aggregate_failures do
            expect { post books_path(params) }.to change(Book, :count).by(1)
            expect(response).to have_http_status(:found)
              .and(redirect_to(books_path))
          end
        end
      end

      context 'invalid request params' do
        let(:request_params) do
          {
            description: Faker::Quote.matz
          }
        end

        it 'does not create a new book' do
          expect { post books_path(request_params) }.not_to change(Book, :count)
          expect(response).to have_http_status(:bad_request)
        end
      end

      context 'invalid book params' do
        let(:book_params) do
          {
            book: {
              title: Faker::Book.title
            }
          }
        end

        it 'does not create a new book' do
          expect { post books_path(book_params) }.not_to change(Book, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'with logged out' do
      it 'redirect to login' do
        aggregate_failures do
          expect { post books_path({}) }.not_to change(Book, :count)
          expect(response).to redirect_to(new_user_session_path)
            .and(have_http_status(:found))
        end
      end
    end
  end

  describe 'PATCH #update' do
    let!(:book) { create(:book) }

    context 'with logged in' do
      include_context 'with logged in user'

      context 'with valid book params' do
        let(:params) do
          {
            book: {
              title: Faker::Book.title
            }
          }
        end

        it 'does update the book' do
          expect { patch book_path(book, params) }.to change(Book, :count).by(0).and(change { book.reload.title })
          expect(response).to have_http_status(:found)
            .and redirect_to(books_path)
          expect(flash[:notice]).to eq("#{params[:book][:title]} was successfully updated.")
        end
      end

      context 'with invalid request params' do
        let(:params) do
          {
            title: Faker::Book.title
          }
        end

        it 'does not update the book' do
          patch book_path(book, params)
          expect(response).to have_http_status(:bad_request)
        end
      end

      context 'with invalid book params' do
        let(:params) do
          {
            book: {
              title: nil
            }
          }
        end

        it 'does not update the book' do
          expect { patch book_path(book, params) }.not_to(change { book.reload.title })
          expect(response).to have_http_status(:unprocessable_entity)
          expect(flash[:alert]).to eq(["Title can't be blank"])
        end
      end
    end

    context 'with logged out' do
      it 'does not update the book' do
        expect do
          patch book_path(book, params: { book: { title: 'New Title' } })
        end.not_to change(book, :title)
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST #reserve' do
    let(:book) { create(:book) }

    context 'when user is logged in' do
      include_context 'with logged in user'

      it 'should create reservation' do
        aggregate_failures do
          expect { post reserve_book_path(book.id) }.to change(Reservation, :count).by(1)
          expect(response).to redirect_to(books_path)
          expect(response).to have_http_status(:found)
          expect(flash[:notice]).to eq("#{book.title} was successfully reserved!")
        end
      end
    end

    context 'when user is logged out' do
      it 'is redirected to sign in' do
        aggregate_failures do
          expect { post reserve_book_path(book.id) }.not_to change(Reservation, :count)
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
