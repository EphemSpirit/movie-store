require 'rails_helper'

RSpec.describe 'Wishlist', type: :request do
  describe 'Wishlist paths' do

    let!(:user) { create(:user, :with_watchlist) }
    let!(:other_user) { create(:user, :with_watchlist) }
    let(:movie) { create(:movie) }

    it 'shows a user\'s wishlist' do
      sign_in user
      get "/api/v1/users/#{user.id}/wishlist"
      expect(response).to have_http_status(200)
    end

    it 'adds a movie to watchlist' do
      sign_in user
      post "/api/v1/users/#{user.id}/add_movie/#{movie.id}"
      expect(response).to have_http_status(200)
    end

    it 'removes a movie from the watchlist' do
      sign_in other_user
      p other_user.wishlist.movies
      delete "/api/v1/users/#{other_user.id}/remove_movie/#{movie.id}"
      p request.params #movie_id passed through params is one greater than the id of the move int he watchlist???
      expect(response).to have_http_status(200)
      p other_user.wishlist.movies
    end
  end
end
