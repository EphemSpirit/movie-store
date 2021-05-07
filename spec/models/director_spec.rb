require 'rails_helper'

RSpec.describe Director, type: :model do

  describe "valid model" do
    let(:director) { create(:director) }

    it "is valid" do
      expect(director).to be_valid
    end
  end
end
