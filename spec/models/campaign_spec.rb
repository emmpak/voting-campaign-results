require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:campaign) { create(:campaign, name: 'Test') }

  before do
    create(:vote, campaign: campaign, choice: 'Choice1', validity: 'pre')
    create(:vote, campaign: campaign, choice: 'Choice1', validity: 'during')
    create(:vote, campaign: campaign, choice: 'Choice1', validity: 'during') 
    create(:vote, campaign: campaign, choice: 'Choice2', validity: 'during')
    create(:vote, campaign: campaign, choice: 'Choice1', validity: 'post')
  end

  describe "#vote_results" do
    it "returns an aggreagate count for valid and invalid votes per choice" do
       expect(campaign.vote_results).to eq({ 'Choice1' => { valid: 2, invalid: 2 }, 'Choice2' => { valid: 1, invalid: 0 }})
   end
  end
end