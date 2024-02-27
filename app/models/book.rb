# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  cover_url   :string           not null
#  description :string           not null
#  genre       :integer          default("software_engineering")
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  enum genre: {
    software_engineering: 0,
    design: 1,
    project_management: 2,
    ruby: 3,
    rails: 4,
    elixir: 5,
    phoenix: 6,
    android: 7,
    ios: 8,
    finance: 9,
    productivity: 10
  }

  has_many :reservations, dependent: :destroy
  has_one :active_reservation, -> { active }, class_name: 'Reservation'
  has_many :readers, through: :reservations, source: :user
  has_one :active_reader, through: :active_reservation, source: :user

  validates :cover_url, :description, :genre, :title, presence: true

  def available?
    active_reservation.blank?
  end

  def reserved?
    active_reservation.present?
  end
end
