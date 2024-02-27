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
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject(:book) { build(:book) }

  describe 'validations' do
    it { expect(book).to be_valid }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:cover_url) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to have_one(:active_reservation) }
    it { is_expected.to have_many(:readers) }
    it { is_expected.to have_one(:active_reader) }
  end
end
