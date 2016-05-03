require "rails_helper"

RSpec.describe Api::CookiesController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/api/cookies").to route_to("api/cookies#create")
    end
  end
end
