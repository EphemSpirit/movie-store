#TESTED VIA POSTMAN DUE TO BEARER TOKEN AUTH

# require 'rails_helper'
#
# RSpec.describe "Casting", type: :request do
#
#   describe "POST /castings" do
#
#     let(:actor) { create(:cast_member) }
#     let(:movie) { create(:movie) }
#
#     it "creates a new casting" do
#       params = { cast_member_id: actor.id, movie_id: movie.id }
#       post "/api/v1/castings", { params: { casting: params } }
#
#       json = JSON.parse(response.body)
#       expect(json['cast_member_id']).to eq(actor.id)
#       expect(json['movie_id']).to eq(movie.id)
#     end
#   end
#
#   describe "DELETE /castings/:id" do
#
#     let(:casting) { create(:casting) }
#
#     it "removes a casting" do
#       delete "/api/v1/castings/#{casting.id}"
#       expect(response).to have_http_status(204)
#     end
#   end
# end
