class Elevator < ApplicationRecord
    include ActiveModel::Dirty
    belongs_to :column

    after_update :send_sms

    def send_sms
        if self.status == "Intervention"
        # Download the twilio-ruby library from twilio.com/docs/libraries/ruby
        require 'twilio-ruby'

        client = Twilio::REST::Client.new(ENV["Twilio_key"])

        from = '+15551234567' # Your Twilio number
        to = '+7276993228' # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Hey friend!"
        )
        end
    end
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
