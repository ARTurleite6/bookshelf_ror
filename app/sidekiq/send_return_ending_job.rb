class SendReturnEndingJob
  include Sidekiq::Job
  sidekiq_options queue: 'critical'

  def perform(recipient_id, reserver_id, book_id)
    reserver = User.find(reserver_id)
    book = Book.find(book_id)
    recipient = User.find(recipient_id)

    AdminMailer.with(recipient:, book:, reserver:)
               .reservation_ending
               .deliver_now
  end
end
