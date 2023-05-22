require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "#vote_results" do
    let(:campaign) { create(:campaign, name: 'Test') }

    before do
      create(:vote, campaign: campaign, choice: 'Choice1', validity: 'pre')
      create(:vote, campaign: campaign, choice: 'Choice1', validity: 'during')
      create(:vote, campaign: campaign, choice: 'Choice1', validity: 'during')
      create(:vote, campaign: campaign, choice: 'Choice2', validity: 'during')
      create(:vote, campaign: campaign, choice: 'Choice1', validity: 'post')
    end

    it "counts only votes with 'during' validity" do
      expect(campaign.vote_results).to eq({ 'Choice1' => 2, 'Choice2' => 1 })
    end
  end
end