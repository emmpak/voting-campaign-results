namespace :import do
  desc "Import votes data from file"
  task votes: :environment do
    VOTE = "VOTE"
    LogEntry = Struct.new(:campaign_name, :validity, :choice)

    File.open("data/vote.txt", "r") do |f|
      f.each_line do |line|
        fields = line.split
        next unless fields.shift == VOTE

        voted_at = Time.at(fields.shift.to_i)
        required_fields = fields[0..2].map { |field| field.split(':').last }

        vote = LogEntry.new(*required_fields)

        campaign = Campaign.find_or_create_by(name: vote.campaign_name)
        Vote.create!(
          campaign: campaign,
          voted_at: voted_at,
          choice: vote.choice,
          validity: vote.validity
        )
      end
    end
  end
end
