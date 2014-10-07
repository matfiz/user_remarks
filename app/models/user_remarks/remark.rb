module UserRemarks
  class Remark < ActiveRecord::Base
    belongs_to :user, class_name: UserRemarks.user_class.to_s

    before_save :set_user_type

    private

    def set_user_type
      self.user_type = UserRemarks.user_class.to_s
    end
  end
end
