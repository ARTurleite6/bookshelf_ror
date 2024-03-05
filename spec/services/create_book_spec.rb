# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateBook do
  let(:create_book) { described_class.new(book_params).perform }

  describe '#perform' do
    context 'when params are valid' do
      let(:book_params) do
        {
          title: Faker::Book.title,
          genre: Book.genres.keys.sample,
          description: Faker::Quote.matz,
          cover_url: Faker::Internet.url
        }
      end

      it 'should create book' do
        aggregate_failures do
          expect { create_book }.to change(Book, :count).by(1)
          expect(create_book.success?).to be_truthy
          expect(Book.last.title).to eq(book_params[:title])
          expect(Book.last.genre).to eq(book_params[:genre])
          expect(Book.last.description).to eq(book_params[:description])
          expect(Book.last.cover_url).to eq(book_params[:cover_url])
        end
      end
    end

    context 'when params are invalid' do
      let(:book_params) do
        {
          title: nil,
          genre: Book.genres.keys.sample,
          description: nil,
          cover_url: nil
        }
      end

      let(:expected_error_messages) do
        ["Cover url can't be blank", "Description can't be blank", "Title can't be blank"]
      end

      it 'should not create the book' do
        aggregate_failures do
          expect { create_book }.not_to change(Book, :count)
          expect(create_book.success?).to be_falsey
          expect(create_book.errors).to eq(expected_error_messages)
        end
      end
    end
  end
end
