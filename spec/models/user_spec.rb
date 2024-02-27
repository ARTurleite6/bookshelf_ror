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
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'validations' do
    it { expect(user).to be_valid }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:encrypted_password) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to have_one(:active_reservation) }
    it { is_expected.to have_one(:active_reading) }
  end
end
