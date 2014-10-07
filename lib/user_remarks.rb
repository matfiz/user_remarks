require "user_remarks/engine"

module UserRemarks
  mattr_accessor :user_class
  mattr_accessor :layout
  #override getter
  def self.user_class
    @@user_class.constantize
  end

  #prepend routes in layout with main_app

end
