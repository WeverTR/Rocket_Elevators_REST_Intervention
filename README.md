# Rocket_Elevators_API

Dropbox:
Fill in the contact form at the bottom of the index page, make sure to:
Put in an email
Remember that email
Attach an image
Head to the back office, create a new customer with the same email as the one from the contact form
Head to the dropbox dashboard (https://www.dropbox.com/home/Apps/RocketElevatorsFiles) and show that a folder has been uploaded with the same name you put in the contact form and that the image you attached is in that folder
Twilio:
Go to the back office and edit an elevator so that its status is set to “Intervention”
Pinky swear that Abdul received a text
Dropbox
Login - Dropbox
Login to Dropbox. Bring your photos, docs, and videos anywhere and keep your files safe.


==================FRESHDESK===================
To make a ticket with freshdesk, you have to make sure that you have an account with an API key.
You can find the api key by going to top right> profile settings> Your API key
After copying your API key, head over to Developers.Freshdesk, and login.
Follow the documentation on how to impliment it into your code, and make sure to have your API key private, as github WILL take it down.
Go into your leads controller inside your admin/models folder, and configure your code to match what is needed to be submitted as a support ticket/feature request.
The gem needed for this API is
	gem "freshdesk"
Put the gem inside your gemfile, then run
	bundle install
==================FRESHDESK===================
To make a ticket with freshdesk, you have to make sure that you have an account with an API key.
You can find the api key by going to top right> profile settings> Your API key
After copying your API key, head over to Developers.Freshdesk, and login.
Follow the documentation on how to impliment it into your code, and make sure to have your API key private, as github WILL take it down.
Go into your leads controller inside your admin/models folder, and configure your code to match what is needed to be submitted as a support ticket/feature request.
The gem needed for this API is
	gem "freshdesk"
Put the gem inside your gemfile, then run
	bundle install

==================FRESHDESK===================
To make a ticket with freshdesk, you have to make sure that you have an account with an API key.
You can find the api key by going to top right> profile settings> Your API key
After copying your API key, head over to Developers.Freshdesk, and login.
Follow the documentation on how to impliment it into your code, and make sure to have your API key private, as github WILL take it down.
Go into your leads controller inside your admin/models folder, and configure your code to match what is needed to be submitted as a support ticket/feature request.
The gem needed for this API is
	gem "freshdesk"
Put the gem inside your gemfile, then run
	bundle install
**leads
api_key = ENV['FRESHDESK_API']
        # Your freshdesk domain
        # freshdesk_domain = 'rocketelevators.freshdesk.com/helpdesk/tickets'
        freshdesk_domain = 'rocketelevators'
        # It could be either your user name or api_key.
        # api_key: ENV['FRESHDESK_API']
        # If you have given api_key, then it should be x. If you have given user name, it should be password
        if @lead.contact_name == nil
        @lead.contact_name = "n/a"
        end
        if @lead.company_name == nil
        @lead.company_name = "n/a"
        end
        if @lead.email == nil
        @lead.email = "n/a"
        end
	.
	.
	.
	etc...
        json_payload = {
            status: 2,
            priority: 1,
            "name": @lead.contact_name,
            "phone": @lead.phone,
            "email": @lead.email,
            "description": @lead.blah blah blah blah here
        }.to_json
        freshdesk_api_path = 'api/v2/tickets'
        freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"
        site = RestClient::Resource.new(freshdesk_api_url, api_key)
**quotes
As for the "contact us" form for a support ticket, impliment the following code into your quotes controller.
            api_key = ENV['FRESHDESK_API']
              if @quote.contact_name == nil
              @quote.contact_name = "n/a"
		            .
		              .
		                .
		                  etc..
              json_payload = {
                status: 2,
                priority: 1,
                "name": @quote.contact_name,
                "email": @quote.contact_email,
                "description": @quote.contact blah blah blah
            }.to_json
and thats all to it!
================AWS POLLY==================
The gem needed for this API is
	gem "aws-sdk"
Put the gem inside your gemfile, then run
	bundle install
To begin with amazon polly, sign up and sign in, then go to https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/polly-example-synthesize-speech.html
Follow the tutorial to create your synthesizer.
For polly to work, you will need a polly controller, a polly.rb file, and a polly view.
Inside the polly controller, insert this code above.
        text_file = "#{Rails.root}/app/text_files/myfile.txt"
        if File.file?(text_file)
            File.delete(text_file)
        end
        mp3_file = "#{Rails.root}app/assets/myfile.mp3"
        if File.file?(mp3_file)
            File.delete(mp3_file)
        end
        # open and write the file
        open(text_file, 'w') do |f|
            f.puts "PUT WHAT YOU WANT IT TO SAY HERE"
        end
This code will intermintently delete the text and mp3 file, then create a new one accordingly, to make sure that there are not files constantly being generated without being deleted.
Make sure your routes are configured to generate the mp3 when you reload the page.
And youre done!


For Google Maps you need to log into the Admin page and then select the Maps page 
There you'll be able to see the addresses from our database plotted on a map as well as Information about each.
Hovering over any of the plotted points will show their street address, company name, numbers of batteries, columns and elevators as well as the name of that addresses' technical contact.

Slack:
Go to the back office and edit an elevator status to anything other than the original status.
A message is posted in the Rocket Elevators Slack elevator operations channel when the status is updated.
