class Vote < ApplicationRecord
  belongs_to :campaign

  enum :validity: {pre: 0, during: 1, post: 2}

  validates :choice, presene: true
  validates :validity, presnece: true, inclusion: { in validities.keys }
  validates :vote_at, presence: true
end
