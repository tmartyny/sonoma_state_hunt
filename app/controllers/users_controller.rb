class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def show
    @challenge = Challenge.first
    @total_points = User.total_points(current_user)
    @total_submissions = User.total_submissions(current_user)
    @next_challenge = User.next_challenge(current_user)
    @has_submissions = User.has_submissions?(current_user)
    @hunt_complete = User.hunt_complete?(current_user)
  end
end
