class User < ActiveRecord::Base
  has_many :submissions
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def self.has_submissions?(user)
    Submission.where(user_id: user.id).any?
  end

  def self.total_points(user)
    return if !User.has_submissions?(user)
    Challenge.find(Submission
                      .where(user_id: user.id)
                      .pluck(:challenge_id)
                     ).map(&:points)
                      .reduce(:+)
  end

  def self.total_submissions(user)
    Submission.where(user_id: user.id).length
  end

  def self.last_submission(user)
    return if !User.has_submissions?(user)
    Submission.where(user_id: user.id)
              .last
              .challenge_id
  end

  def self.hunt_complete?(user)
    Challenge.final_challenge_id == User.last_submission(user)
  end

  def self.next_challenge(user)
    return if !User.has_submissions?(user)
    Challenge.find(Submission
                .where(user_id: user.id)
                .last
                .challenge_id)
                .next
  end
end