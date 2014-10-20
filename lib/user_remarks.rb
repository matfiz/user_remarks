require "user_remarks/engine"
require 'slack-notifier'

module UserRemarks
  mattr_accessor :user_class
  mattr_accessor :layout
  mattr_accessor :slack_team
  mattr_accessor :slack_token
  mattr_accessor :slack_channel
  mattr_accessor :mount_subdomain
  mattr_accessor :mail_sender

  #override getter
  def self.user_class
    @@user_class.constantize
  end

end
