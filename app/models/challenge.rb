class Challenge < ApplicationRecord
  belongs_to :user
  has_many :challenge_detail
  has_one :challenge_summary

  enum format: { movie: 0, image: 1 }
end
