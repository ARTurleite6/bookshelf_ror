# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateBook do
  let(:book) { create(:book) }
  let(:update_book) do
    described_class.new(book, book_params).perform
  end

  describe '#perform' do
    context 'with valid params' do
      let(:book_params) do
        {
          title: Faker::Book.title,
          description: Faker::Lorem.paragraph
        }
      end

      it 'updates the book' do
        expect(update_book.success?).to be_truthy
        expect(Book.last.title).to eq(book_params[:title])
        expect(Book.last.description).to eq(book_params[:description])
      end
    end

    context 'with invalid params' do
      let(:book_params) do
        {
          title: nil
        }
      end

      it 'does not update the book' do
        expect(update_book.success?).to be_falsey
        expect(update_book.errors).to eq(["Title can't be blank"])
      end
    end
  end
end
