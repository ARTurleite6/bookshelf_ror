# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  first_name          :string           not null
#  is_admin            :boolean          default(FALSE)
#  last_name           :string           not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_one :active_reservation, -> { active }, class_name: 'Reservation'
  has_one :active_reading, through: :active_reservation, source: :book

  validates :first_name, :last_name, :encrypted_password, presence: true
  validates :email, uniqueness: true, presence: true

  scope :admin_users, -> { where(is_admin: true) }

  def active_reading?
    active_reservation.present?
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
