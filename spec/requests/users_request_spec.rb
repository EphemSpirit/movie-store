require 'rails_helper'

RSpec.describe "Users", type: :request do

  let!(:user) { create(:user) }

  describe "basic func" do
    it "lets me use the helper method" do
      sign_in user
    end
  end
end
