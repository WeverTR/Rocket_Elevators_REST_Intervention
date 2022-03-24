class Elevator < ApplicationRecord
    belongs_to :column

    after_update :send_sms
    # require 'twilio-ruby'

    private
    def send_sms
        if self.status == "Intervention"
            account_sid = ENV['twilio_account_sid']
            auth_token = ENV['twilio_auth_token']
            client = Twilio::REST::Client.new(account_sid, auth_token)
            
            from = '+12543235637' # Your Twilio number
            to = '+17276993228' # Your mobile phone number
            
            client.account.sms.messages.create(
                from: from,
                to: to,
                body: "Elevator moment!"
            )
        end
    end
end
