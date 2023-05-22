require 'rails_helper'
require 'rake'

describe "import:votes" do
  before :all do
    Rake.application.rake_require "tasks/import_votes"
    Rake::Task.define_task(:environment)
  end

  let(:run_rake_task) do
    Rake::Task["import:votes"].reenable
    Rake.application.invoke_task "import:votes"
  end

  let(:voted_at) { 1168041805 }
  let(:campaign) { "ssss_uk_01B" }
  let(:choice) { "Antony" }

  let(:log_entry) { "VOTE #{voted_at} Campaign:#{campaign} Validity:during Choice:#{choice} CONN:MIG01TU MSISDN:00777778359999 GUID:E6109CA1-7756-45DC-8EE7-677CA7C3D7F3 Shortcode:63334"}

  describe "importing votes from the log file" do
    before do
      allow(File).to receive(:open).and_yield(StringIO.new(log_entry))
    end

    it "creates a new campaign" do
      expect { run_rake_task }.to change { Campaign.count }.by(1)
      expect(Campaign.first.name).to eq(campaign)
    end

    it "creates a new vote" do
      expect { run_rake_task }.to change { Vote.count }.by(1)
      
      vote = Vote.first
      expect(vote.voted_at).to eq(Time.at(voted_at))
      expect(vote.during?).to be true
      expect(vote.choice).to eq(choice)
      expect(vote.campaign).to eq(Campaign.first)
    end
  end
end