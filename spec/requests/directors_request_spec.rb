require 'rails_helper'

RSpec.describe "Director", type: :request do

  describe 'GET /directors' do
    it 'returns all directors' do
      director = create_list(:director, 20)
      get "/api/v1/directors"
      json = JSON.parse(response.body)

      expect(json.length).to eq(20)
    end
  end

  describe 'POST /directors' do
    it 'creates a new director' do
      params = { name: "Jason", years_active: 4 }

      post "/api/v1/directors", { params: { director: params } }
      json = JSON.parse(response.body)
      expect(json['name']).to eq("Jason")
      expect(json['years_active']).to eq(4)
    end
  end

  describe 'GET /directors/:id' do
    it "gets a single director" do
      director = create(:director)
      get "/api/v1/directors/#{director.id}"
      json = JSON.parse(response.body)
      expect(json['name']).to eq(director.name)
      expect(json['years_active']).to eq(director.years_active)
    end
  end

  describe 'DELETE /directors/:id' do
    it 'deletes a director' do
      director = create(:director)

      delete "/api/v1/directors/#{director.id}"

      expect(response).to have_http_status(204)
    end
  end

  describe 'GET /directors/top_directors' do
    it "gets the 5 most prolific directors" do
      directors = create_list(:director, 10)
      get "/api/v1/top_directors"
      json = JSON.parse(response.body)
      expect(json.length).to eq(5)
    end
  end
end
