class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  validates :challenge_id, uniqueness: true
  validates :challenge_id, :user_id, presence: true
end
