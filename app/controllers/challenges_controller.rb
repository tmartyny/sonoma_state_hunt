class ChallengesController < ApplicationController
  include ChallengesConcerns
  respond_to :html, :json
  def show
    @submission = Submission.new
    find_challenge
    total_points
    render 'show', layout: false
  end
end
