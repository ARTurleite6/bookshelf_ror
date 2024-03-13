# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  before_action :set_reserver
  before_action :set_book

  def new_reservation
    mail(subject: "New reservation on #{@book.title}", to: @recipient.email)
  end

  def reservation_ending
    mail(subject: "Ended reservation on #{@book.title}", to: @recipient.email)
  end

  private

  def set_reserver
    # @type [User]
    @reserver = params[:reserver]
  end

  def set_book
    # @type [Book]
    @book = params[:book]
  end
end
