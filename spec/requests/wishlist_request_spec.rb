require 'rails_helper'

RSpec.describe 'Wishlist', type: :request do
  describe 'Wishlist paths' do
    let(:user) { create(:user, :with_watchlist) }
    it 'shows a users wishlist' do
      p user.wishlist
    end
  end
end
