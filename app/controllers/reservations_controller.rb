class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservations, only: %i[index]
  before_action :set_reservation, only: %i[update]

  def index; end

  def update; end

  private

  def set_reservations
    @reservations = current_user.reservations.includes(:book).order(created_at: :desc)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
