class Campaign < ApplicationRecord
  has_many :votes

  validates :name, presence: true, uniqueness: true

  def vote_results
    votes.during.group(:choice).count
  end
end
