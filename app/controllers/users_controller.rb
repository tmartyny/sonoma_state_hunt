class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @challenge = Challenge.first
    @total_points = User.total_points(current_user)
    @total_submissions = User.total_submissions(current_user)
    @next_challenge = User.next_challenge(current_user)
  end

end
