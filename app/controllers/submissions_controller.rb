class SubmissionsController < ApplicationController
  before_action :all_submissions, only: [:index]
  def new
    @submission = Submission.new
  end

  def create
    current_challenge = Challenge.find(submission_params[:challenge_id])
    @challenge = current_challenge.next
    @submission = Submission.new(submission_params)
    @submission.user_id = current_user.id
    if @submission.save! && @challenge
      redirect_to user_challenge_path(current_user, @challenge)
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:user_id, :challenge_id, :text, :photo, :lat, :lon)
  end
end
