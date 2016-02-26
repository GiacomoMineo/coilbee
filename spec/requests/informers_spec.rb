require 'rails_helper'

RSpec.describe "Informers", type: :request do
  describe "GET /informers" do
    it "works! (now write some real specs)" do
      get informers_path
      expect(response).to have_http_status(200)
    end
  end
end
