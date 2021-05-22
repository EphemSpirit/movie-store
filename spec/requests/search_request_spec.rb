require 'rails_helper'

RSpec.describe "Search", type: :request do

  describe "GET search/:search/:filter" do
    let!(:director) { create(:director, :with_movie) }

    it "returns correct results" do
      params = { term: "estertes", filter: "Director" }
      get "/api/v1/search", { params: { search: params } }
      json = JSON.parse(response.body)
      expect(json.length).to eq(2) #1 element is the director, other is their movies
      expect(json[0]['name']).to eq("Jimtestertest")
    end

    it "throws an error if no term is given" do
      params = { term: nil, filter: "Director" }
      get "/api/v1/search", { params: { search: params } }
      json = JSON.parse(response.body)
      expect(json['status']).to eq("error")
      expect(json['message']).to eq("Please enter a Search Term")
    end

    it "throws an error without a filter" do
      params = { term: "im" , filter: nil }
      get "/api/v1/search", { params: { search: params } }
      json = JSON.parse(response.body)
      expect(json['status']).to eq('error')
      expect(json['message']).to eq('Please Use A Filter')
    end
  end

end
