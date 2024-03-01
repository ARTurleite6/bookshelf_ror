require 'rails_helper'

RSpec.shared_context 'with logged in user' do
    let(:user) { create(:user) }

    before do
        sign_in(user)
    end
end