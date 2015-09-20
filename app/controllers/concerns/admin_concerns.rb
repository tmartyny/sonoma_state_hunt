module AdminConcerns
  extend ActiveSupport::Concern
  included do
    def current_submissions
      Submission.joins('LEFT OUTER JOIN users ON users.current_student = true').where(photo_approved: nil)
    end
    def current_students
      User.where(current_student: true)
    end
  end
end