class Challenge < ApplicationRecord
  belongs_to :user
  has_many: challenge_detail
  has_many: challenge_summary
end
