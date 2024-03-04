# frozen_string_literal: true

class BooksController < ApplicationController
  include BookHelper
  before_action :authenticate_user!
  before_action :set_book, only: %i[show edit update reserve]

  def index
    @books = Book.all.order(created_at: :asc)
  end

  def new; end

  def reserve
    result = ReserveBook.new(@book, current_user.id).perform

    if result.success?
      respond_to do |format|
        format.html do
          redirect_to(books_path, notice: "#{@book.title} was successfully reserved!")
        end
        format.json { render json: { reservation: result.reservation }, status: :created }
      end
    else
      respond_to do |format|
        format.html do
          flash[:alert] = result.errors
          render :show, status: :unprocessable_entity
        end
        format.json { render json: { errors: result.errors }, status: :unprocessable_entity }
      end
    end
  end

  def create
    result = CreateBook.new(book_params).perform

    if result.success?
      respond_to do |format|
        format.html do
          redirect_to(books_path,
                      notice: "#{result.book.title} was successfully created.")
        end
        format.json { render json: { book: result.book }, status: :created }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = result.errors
          render :new, status: :unprocessable_entity
        end
        format.json { render json: { errors: result.errors }, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    result = UpdateBook.new(@book, book_params).perform

    if result.success?
      respond_to do |format|
        format.html do
          redirect_to(books_path, notice: "#{result.book.title} was successfully updated.")
        end
        format.json { render json: { book: result.book }, status: :ok }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = result.errors
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: { errors: result.errors }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :genre, :description, :cover_url)
  end
end
