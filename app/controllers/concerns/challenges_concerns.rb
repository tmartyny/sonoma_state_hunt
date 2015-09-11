module ChallengesConcerns
  extend ActiveSupport::Concern
  included do
    def first_challenge
      @challenge = Challenge.first
    end
    def find_challenge
      @challenge = Challenge.find(params[:id])
    end
    def all_challenges
      @challenges = Challenge.all
    end
    def total_points
      @total_points = User.total_points(current_user)
    end
  end
end