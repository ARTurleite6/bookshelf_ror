class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservations, only: %i[index]
  before_action :set_reservation, only: %i[show update]

  def index; end

  def show; end

  def update
    result = ReturnBook.new(@reservation).perform

    if result.success?
      respond_to do |format|
        format.turbo_stream
        format.json do
          render(json: { reservation: result.reservation }, status: :ok)
        end
      end
    else
      respond_to do |format|
        format.json { render(json: {  errors: result.errors }, status: :unprocessable_entity) }
      end
    end
  end

  private

  def set_reservations
    @reservations = current_user.reservations.includes(:book).order(created_at: :desc)
  end

  def set_reservation
    @reservation = Reservation.find_by!(user: current_user, returned_on: nil)
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
