# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  before_action :set_reserver
  before_action :set_book

  default to: -> { User.where(is_admin: true).pluck(:email) }

  def new_reservation
    mail(subject: "New reservation on #{@book.title}")
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
