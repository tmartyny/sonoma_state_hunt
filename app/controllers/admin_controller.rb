class AdminController < ApplicationController
  include AdminConcerns
  def show
    @students = current_students
    @submissions = current_submissions
  end

  def search
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    end
  end

  def reset
    if params[:reset]
      User.update_all(current_student: false)
      redirect_to admin_path
    end
  end

  def hunt
    if current_submissions
      @current_submission = current_submissions.first
      @submission_photo = @current_submission.photo
      @challenge_name = Challenge.find(@current_submission.challenge_id).name
    end
  end

  def swipe
    # if 
  end

  def swipe_params
    params.require()
  end
end