class ChallengesController < ApplicationController
  include ChallengesConcerns
  respond_to :html, :json
  def show
    @submission = Submission.new
    @user = User.find(params[:user_id])
    @challenge = Challenge.find(params[:id])
    @total_points = User.total_points(current_user)
    render 'show', layout: false
  end
end
