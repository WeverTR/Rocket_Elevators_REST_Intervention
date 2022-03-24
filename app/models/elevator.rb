class Elevator < ApplicationRecord
    include ActiveModel::Dirty
    belongs_to :column

    oldStatus = ""
    before_update do
        oldStatus = self.status_was
     end
     after_update do
        if oldStatus != self.status
          notifier = Slack::Notifier.new ENV['slack_webhook']
          notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{oldStatus} to #{self.status}"
        end
     end
end
