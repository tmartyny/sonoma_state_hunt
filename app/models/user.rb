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
    Challenge.find(Submission
                    .where(user_id: user.id)
                    .pluck(:challenge_id)
                   ).map(&:points)
                    .reduce(:+)
  end
end
