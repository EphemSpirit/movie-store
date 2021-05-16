require 'rails_helper'

RSpec.describe "Users", type: :request do

  let!(:user) { create(:user) }

  context "not signed in" do
    it "redirects a non-logged in user" do
      get "/api/v1/user/#{user.id}"
      expect(response).to have_http_status(302)
    end
  end

  it "gets the index page" do
    get "/api/v1/users"
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body).length).to eq(1)
  end

  context "signed in" do
    it "gets a user page when signed in" do
      get "/api/v1/user/#{user.id}"
      expect(response).to have_http_status(302)
      sign_in user
      get "/api/v1/user/#{user.id}"
      expect(response).to have_http_status(200)
    end
  end
end
