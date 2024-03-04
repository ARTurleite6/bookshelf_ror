# frozen_string_literal: true

class UpdateBook
  Result = Struct.new(:success?, :book, :errors, keyword_init: true)

  # @param book [Book]
  def initialize(book, book_params)
    @book = book
    @book_params = book_params
  end

  # @returns [Result]
  def perform
    book.update!(book_params)

    Result.new(success?: true, book:)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(success?: false, errors: e.record&.errors&.full_messages)
  end

  private

  attr_accessor :book
  attr_reader :book_params
end
