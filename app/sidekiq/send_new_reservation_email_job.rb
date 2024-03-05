# frozen_string_literal: true

class SendNewReservationEmailJob
  include Sidekiq::Job
  sidekiq_options queue: 'default'

  def perform(user_id, book_id, recipient_id)
    recipient = User.find(recipient_id)
    user = User.find(user_id)
    book = Book.find(book_id)

    AdminMailer.with(recipient:, reserver: user, book:)
               .new_reservation
               .deliver_now
  end
end
