class Customer < ApplicationRecord
    has_many :buildings
    belongs_to :address 
    belongs_to :user
    #when new customer is created
    # after_create :upload_files
        
    def upload_files
        # A random person would come to the site and fill out the contact form, thus creating a lead
        # This "lead" would then be turned into a customer (ie. In the back office, in your Customers table, a new customer entry would be added using the same email as the lead)

        client = DropboxApi::Client.new(ENV["RocketElevatorsFiles"])
        #find a lead with a matching customer email
        lead = Lead.find_by_email(self.company_contact_email)
        #if lead exists
        if lead
            #if lead email matches a customer email
            if lead.email == self.company_contact_email
                #create directory
                client.mkdir("#{self.customer}") 
                #upload
                client.upload("/#{self.customer}", lead)
            end 
        end
    end
end