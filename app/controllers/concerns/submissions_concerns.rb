module SubmissionsConcerns
  extend ActiveSupport::Concern
    included do
      def find_submission
      end
      def all_submissions
      end
    end
  end
end