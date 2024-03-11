# frozen_string_literal: true

class DestroyBook
  Result = Struct.new(:success?, :errors, keyword_init: true)

  # @param book [Book]
  def initialize(book)
    @book = book
  end

  def perform
    book.destroy!

    Result.new({ success?: true })
  end

  private

  #@return [Book]
  attr_reader :book
end
