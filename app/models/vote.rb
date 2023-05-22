class Vote < ApplicationRecord
  belongs_to :campaign

  enum :validity: {pre: 0, during: 1, post: 2}

  validates :candidate, presene: true
  validates :validity, presnece: true, inclusion: { in validities.keys }
end
