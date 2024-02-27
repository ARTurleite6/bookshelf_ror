class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all.order(created_at: :asc)
  end
end
