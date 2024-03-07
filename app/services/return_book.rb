class ReturnBook
  Result = Struct.new(:success?, :reservation, :errors, keyword_init: true)

  # @param reservation [Reservation]
  def initialize(reservation)
    @reservation = reservation
  end

  def perform
    @reservation.update!(returned_on: Date.today)
    send_return_notification(reservation)

    Result.new({ success?: true, reservation: @reservation })
  rescue ActiveRecord::RecordInvalid => e
    Result.new({ success?: false, errors: e.record&.errors&.full_messages })
  end

  private

  attr_accessor :reservation

  #  @param reservation [Reservation]
  def send_return_notification(reservation)
    User.admin_users.each do |user|
      SendReturnEndingJob.perform_async(user.id, reservation.book.id, reservation.user.id)
    end
  end
end
