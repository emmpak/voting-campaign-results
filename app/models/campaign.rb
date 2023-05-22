class Campaign < ApplicationRecord
  has_many :votes

  validates :name, presence: true, uniqueness: true
  
  def vote_results
    vote_counts = votes.group(:choice, :validity).count

    results = Hash.new { |h, k| h[k] = { valid: 0, invalid: 0 } }

    vote_counts.each do |(choice, validity), count|
      if validity == "during"
        results[choice][:valid] += count
      else
        results[choice][:invalid] += count
      end
    end

    results
  end
end
