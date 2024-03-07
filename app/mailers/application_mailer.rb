# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  before_action :set_recipient
  default from: 'bookshelf@deemaze.com'
  layout 'mailer'

  private

  def set_recipient
    #  @type [User]
    @recipient = params[:recipient]
  end
end
