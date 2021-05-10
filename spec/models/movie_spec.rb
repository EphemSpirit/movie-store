require 'rails_helper'

RSpec.describe Movie, type: :model do


  let(:movie) { create(:movie) }
  let(:casted) { create(:movie, :with_cast) }

  context "validations" do

    it "is invalid without all attributes" do
      movie.title = nil
      expect(movie).not_to be_valid
    end

    it "is valid with all attributes" do
      expect(movie).to be_valid
    end
  end

  context "cast members" do

    it "has a cast" do
      expect(casted.cast_members.length).to eq(1)
    end
  end
  
end
