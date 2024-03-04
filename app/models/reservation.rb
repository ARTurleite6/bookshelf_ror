# frozen_string_literal: true

# == Schema Information
#
# Table name: reservations
#
#  id          :bigint           not null, primary key
#  returned_on :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  book_id     :bigint           not null
#  user_id     :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :book_cannot_be_double_reserved, on: :create
  validate :user_cannot_reserve_multiple_books, on: :create
  validate :returned_on_cannot_be_in_the_past
  validate :returned_on_cannot_be_revised, on: :update

  scope :active, -> { where(returned_on: nil) }
  scope :inactive, -> { where.not(returned_on: nil) }

  def returned?
    returned_on.present?
  end

  private

  def book_cannot_be_double_reserved
    errors.add(:base, 'This book is already reserved') if book.reserved?
  end

  def user_cannot_reserve_multiple_books
    errors.add(:base, 'You already have an ongoing reservation') if user.active_reading?
  end

  def returned_on_cannot_be_in_the_past
    return unless returned_on.present? && returned_on < Date.today

    errors.add(:returned_on, 'Book cannot be returned in the past')
  end

  def returned_on_cannot_be_revised
    errors.add(:returned_on, 'This book already had been returned') if returned_on_previously_changed?
  end
end
