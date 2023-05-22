class Vote < ApplicationRecord
  belongs_to :campaign

  enum validity: {pre: 0, during: 1, post: 2}

  validates :choice, presence: true
  validates :validity, presence: true, inclusion: { in: validities.keys }
  validates :voted_at, presence: true
end
