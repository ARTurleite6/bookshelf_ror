require 'rails_helper'

RSpec.describe DestroyBook do
  describe '#perform' do
    let(:destroy_book) { described_class.new(book).perform }

    context 'when book exists' do
      let(:book) { create(:book) }

      it 'destroys the book' do
        destroy_book

        aggregate_failures do
          expect(destroy_book.success?).to be_truthy
          expect { book.reload }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

  end
end