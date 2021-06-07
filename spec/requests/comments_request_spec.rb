require 'rails_helper'
require 'vcr'

RSpec.describe "Comments", type: :request do

  describe "fetch a comment" do

    let(:director) { create(:director) }
    let(:movie) { Movie.create(name: "Test",
                             description: "Test",
                             genre: "Horror",
                             rating: 0.987e1,
                             release_date: "2012-01-01",
                             director_id: director.id) }
    let(:user) { create(:user) }
    let(:comment) { movie.comments.create(body: "Test comment", user_id: user.id) }

    it "fetches a comment", :vcr do
      sign_in :user
      headers = { "AUTHORIZATION" => "#{Rails.application.credentials.dig(:auth0, :token)}"}
      VCR.use_cassette("fetch_comment") do
        #request.headers["Authorization"] = Rails.application.credentials.dig(:auth0, :token)
        get "/api/v1/comments/#{comment.id}", params: {}, headers: headers.to_json
        p response.body
        p response.headers #not authorization header here, response is 401 not authenticated
        json = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(json.length).to eq(1)
      end
    end

    xit "fetches another comment", :vcr do
      sign_in :user
      VCR.use_cassette("fetch_new_comment") do
        request = get "/api/v1/comments/#{comment.id}", params: {}, headers: { "Authorization" => "#{Rails.application.credentials.dig(:auth0, :token)}"}
        p response.body
      end
    end
  end

  # context "not logged in" do
  #
  #   describe "redirect every comment path if not logged in" do
  #
  #     let(:director) { create(:director) }
  #     let(:movie) { Movie.create(name: "Test",
  #                          description: "Test",
  #                          genre: "Horror",
  #                          rating: 0.987e1,
  #                          release_date: "2012-01-01",
  #                          director_id: director.id) }
  #     let(:user) { create(:user) }
  #     let(:comment) { movie.comments.create(body: "Test comment", user_id: user.id) }
  #
  #     it 'redirects show' do
  #       get "/api/v1/comments/#{comment.id}"
  #       expect(response).to have_http_status(401)
  #     end
  #
  #   end
  #
  # end
  #
  # context "logged in" do
  #
  #   describe "GET /index" do
  #
  #     let(:director) { create(:director) }
  #     let(:movie) { Movie.create(name: "Test",
  #                          description: "Test",
  #                          genre: "Horror",
  #                          rating: 0.987e1,
  #                          release_date: "2012-01-01",
  #                          director_id: director.id) }
  #     let(:user) { create(:user) }
  #     let(:comment) { movie.comments.create(body: "Test comment", user_id: user.id) }
  #
  #     it "renders the index" do
  #       sign_in :user
  #       get "/api/v1/comments/#{comment.id}"
  #       expect(response).to have_http_status(401) #actual authenticated tested via postman
  #     end
  #
  #   end
  #
  # end
end
