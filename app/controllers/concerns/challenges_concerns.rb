module ChallengesConcerns
  extend ActiveSupport::Concern
  included do
    def first_challenge
      @challenge = Challenge.first
    end
    def all_challenges
      @challenges = Challenge.all
    end
  end
end