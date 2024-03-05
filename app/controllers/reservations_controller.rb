class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations.includes(:book).order(created_at: :desc)
  end

  def show; end
end
