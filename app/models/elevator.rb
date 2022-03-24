class Elevator < ApplicationRecord
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
end
