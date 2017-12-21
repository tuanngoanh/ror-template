require 'rails_helper'

RSpec.describe "About Us", type: :request do
  describe "GET /about-us" do
    it "expect return about us page" do
      get about_us_path
      expect(response).to have_http_status(200)
    end
  end
end
