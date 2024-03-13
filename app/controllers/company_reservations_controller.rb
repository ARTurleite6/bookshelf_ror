# frozen_string_literal: true

class CompanyReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_reservations, only: %i[index]

  def index; end

  private

  def set_company_reservations
    @reservations = Reservation.includes(:user, :book)
                               .active
                               .where.not(user_id: current_user.id)
  end
end
