require 'rails_helper'

RSpec.describe "CastMember", type: :request do

  describe "GET /cast_members" do

    it "returns all cast members and their movies" do
      create_list(:cast_member, 10, :with_movies)
      get "/api/v1/cast_members"
      json = JSON.parse(response.body)

      expect(json.length).to eq(10)
    end

  end

  describe "POST /cast_members" do

    it "creates a new cast member" do
      params = { name: "Devin",
                 age: 23,
                 trivia_fact: "Is not old",
                 birthday: "1990-06-23",
                 birth_city: "Memphis"}

      post "/api/v1/cast_members", { params: { cast_member: params } }
      json = JSON.parse(response.body)
      expect(json['name']).to eq('Devin')
      expect(json['age']).to eq(23)
      expect(json['trivia_fact']).to eq("Is not old")
      expect(json['birthday']).to eq("1990-06-23")
      expect(json['birth_city']).to eq("Memphis")
    end
  end

  describe "GET /cast_members/:id" do

    let(:cast_member) { create(:cast_member, :with_movies) }

    it "gets one cast_member" do
      get "/api/v1/cast_members/#{cast_member.id}"

      json = JSON.parse(response.body)
      expect(json.length).to eq(7) #why is this 7 :/
      expect(json['name']).to eq(cast_member.name)
    end
  end

  describe "PUT /cast_members/:id" do


    it "edits a cast_member" do
      cast_member = create(:cast_member)
      new_name = "New Name"
      params = { name: new_name }

      patch "/api/v1/cast_members/#{cast_member.id}", { params: { cast_member: params } }

      json = JSON.parse(response.body)
      expect(json['name']).to eq("New Name")
    end
  end

  describe "DELETE /cast_members/:id" do

    let(:cast_member) { create(:cast_member, :with_movies) }

    it "deletes a cast_member" do
      delete "/api/v1/cast_members/#{cast_member.id}"

      expect(response).to have_http_status(204)
    end
  end
end
