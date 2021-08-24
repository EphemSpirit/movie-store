require 'rails_helper'

RSpec.describe User, type: :model do
  describe "wishlist creation" do
    it "makes a wishlist when a user is created" do
      expect{ create(:user) }.to change{ Wishlist.count }.by(1)
    end
  end
end
