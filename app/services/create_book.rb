# frozen_string_literal: true

class CreateBook
  Result = Struct.new(:success?, :book, :errors, keyword_init: true)

  def initialize(book_params)
    @book_params = book_params
  end

  def perform
    book = Book.create!(book_params)

    Result.new({ success?: true, book: })
  rescue ActiveRecord::RecordInvalid => e
    Result.new({ success?: false, errors: e.record&.errors&.full_messages })
  end

  private

  attr_reader :book_params
end
