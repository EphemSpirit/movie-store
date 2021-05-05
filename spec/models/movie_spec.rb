require 'rails_helper'

RSpec.describe Movie, type: :model do


  let(:movie) { create(:movie) }

  context "validations" do

    it "is invalid without all attributes" do
      movie.title = nil
      expect(movie).not_to be_valid
    end

    it "is valid with all attributes" do
      expect(movie).to be_valid
    end
  end
end
