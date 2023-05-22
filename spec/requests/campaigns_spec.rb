require 'rails_helper'

RSpec.describe "Campaigns", type: :request do
  let!(:campaign) { create(:campaign) }
  
  describe "GET /index" do
    it "returns http success" do
      get campaigns_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get campaign_path(campaign)
      expect(response).to have_http_status(:success)
    end
  end

end
