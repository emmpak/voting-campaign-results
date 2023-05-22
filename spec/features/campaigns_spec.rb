require 'rails_helper'

RSpec.feature "Campaigns", type: :feature do
  describe "index page" do
    let!(:campaign1) { create(:campaign, name: 'Campaign1') }
    let!(:campaign2) { create(:campaign, name: 'Campaign2') }

    before do
      visit campaigns_path
    end

    it "displays all campaigns" do
      expect(page).to have_text(campaign1.name)
      expect(page).to have_text(campaign2.name)
    end

    it "links to the show page of each campaign" do
      click_link campaign1.name
      expect(page).to have_current_path(campaign_path(campaign1))
    end
  end

  describe "show page" do
    let!(:campaign) { create(:campaign, name: 'Campaign1') }
    let!(:vote1) { create(:vote, campaign: campaign, choice: 'Choice1', validity: 'during') }
    let!(:vote2) { create(:vote, campaign: campaign, choice: 'Choice2', validity: 'during') }
    let!(:vote3) { create(:vote, campaign: campaign, choice: 'Choice1', validity: 'post') }

    before do
      visit campaign_path(campaign)
    end

    it "displays campaign's name" do
      expect(page).to have_text(campaign.name)
    end

    it "displays vote counts for 'during' validity votes" do
      expect(page).to have_text("Choice1: 1")
      expect(page).to have_text("Choice2: 1")
    end
  end
end
