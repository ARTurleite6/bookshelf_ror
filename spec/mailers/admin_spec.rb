# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminMailer, type: :mailer do
  describe 'notify new reservation' do
    let(:mail) { described_class.with(recipient: admin, reserver: user, book:).new_reservation }
    let(:user) { create(:user) }
    let(:admin) { create(:user, is_admin: true) }
    let!(:admin2) { create(:user, is_admin: true) }
    let(:book) { create(:book) }

    it 'renders the headers' do
      aggregate_failures do
        expect(mail.subject).to eq("New reservation on #{book.title}")
        expect(mail.to).to eq([admin.email])
        expect(mail.from).to eq(['bookshelf@deemaze.com'])
        # TODO: Add test for the mail body
      end
    end
  end
end
