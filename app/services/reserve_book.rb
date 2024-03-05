# frozen_string_literal: true

class ReserveBook
  Result = Struct.new(:success?, :reservation, :book, :errors, keyword_init: true)

  # @param book [Book]
  # @param user_id [Integer]
  def initialize(book, user_id)
    @book = book
    @user_id = user_id
  end

  def perform
    reservation = Reservation.create!(user_id:, book:)
    send_reservation_email(reservation)

    Result.new({ success?: true, reservation:, book: })
  rescue ActiveRecord::RecordInvalid => e
    Result.new({ success?: false, errors: e.record&.errors&.full_messages, book: })
  end

  private

  # @return [Book]
  attr_reader :book
  # @return [Integer]
  attr_reader :user_id

  # @param reservation [Reservation]
  def send_reservation_email(reservation)
    User.admin_users.each do |admin|
      SendNewReservationEmailJob.perform_async(admin.id, reservation.user_id, reservation.book_id)
    end
  end
end
