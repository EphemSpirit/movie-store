require 'rails_helper'

RSpec.describe 'Wishlist', type: :request do
  describe 'Wishlist paths' do

    let!(:user) { create(:user, :with_watchlist) }

    it 'shows a user\'s wishlist' do
      sign_in user
      get "/api/v1/users/#{user.id}/wishlist"
      #redirects to user sign in
      expect(response).to have_http_status(200)
    end
  end
end
