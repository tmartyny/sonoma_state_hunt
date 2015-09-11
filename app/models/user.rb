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

  def self.total_points(user)
    if Submission.where(user_id: user.id).length > 0
      Challenge.find(Submission
                      .where(user_id: user.id)
                      .pluck(:challenge_id)
                     ).map(&:points)
                      .reduce(:+)
    else
      nil
    end
  end

  def self.total_submissions(user)
    Submission.pluck(:user_id).length
  end

  def self.next_challenge(user)
    if Submission.where(user_id: user.id).length > 0
      Challenge.find(Submission
                .where(user_id: user.id)
                .last
                .challenge_id)
                .next
    else
      nil
    end
  end
end