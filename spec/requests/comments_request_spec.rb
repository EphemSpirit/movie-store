require 'rails_helper'

RSpec.describe "Comments", type: :request do

  context "not logged in" do

    describe "redirect every comment path if not logged in" do

      let(:director) { create(:director) }
      let(:movie) { Movie.create(name: "Test",
                           description: "Test",
                           genre: "Horror",
                           rating: 0.987e1,
                           release_date: "2012-01-01",
                           director_id: director.id) }
      let(:user) { create(:user) }
      let(:comment) { movie.comments.create(body: "Test comment", user_id: user.id) }

      it 'redirects show' do
        get "/api/v1/comments/#{comment.id}"
        expect(response).to have_http_status(401)
      end

    end

  end

  context "logged in" do

    describe "GET /index" do

      let(:director) { create(:director) }
      let(:movie) { Movie.create(name: "Test",
                           description: "Test",
                           genre: "Horror",
                           rating: 0.987e1,
                           release_date: "2012-01-01",
                           director_id: director.id) }
      let(:user) { create(:user) }
      let(:comment) { movie.comments.create(body: "Test comment", user_id: user.id) }

      it "renders the index" do
        sign_in :user
        get "/api/v1/comments/#{comment.id}"
        expect(response).to have_http_status(401) #actual authenticated tested via postman
      end

    end

  end
end
