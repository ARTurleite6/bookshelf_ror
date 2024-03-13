# frozen_string_literal: true

class UserMailer < ApplicationMailer
  before_action :set_book

  default to: -> { @recipient.email }

  def reading_proggress
    mail(subject: "Enjoying #{@book.title}?")
  end

  private

  def set_book
    #@type book [Book]
    @book = params[:book]
  end
end
