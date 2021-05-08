require 'rails_helper'

RSpec.describe Director, type: :model do

  describe "valid model" do
    let(:director) { create(:director) }

    it "is valid" do
      expect(director).to be_valid
    end
  end

  describe "invalid model" do
    let(:director) { create(:director) }

    it "is invalid without a name" do
      director.name = nil
      expect(director).to_not be_valid
    end

    it "is invalid without years_active" do
      director.years_active = nil
      expect(director).to_not be_valid
    end
  end
end
