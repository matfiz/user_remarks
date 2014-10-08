module UserRemarks
  class Remark < ActiveRecord::Base
    belongs_to :user, class_name: UserRemarks.user_class.to_s

    before_save :set_user_type
    after_save :send_slack_notification

    private

    def set_user_type
      self.user_type = UserRemarks.user_class.to_s
    end

    def send_slack_notification
      #
      notifier = ::Slack::Notifier.new UserRemarks.slack_team, UserRemarks.slack_token, channel: UserRemarks.slack_channel
      notifier.username = user.to_s
      notifier.ping "#{title} || #{text}"
    end
  end
end
