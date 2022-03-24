ActiveAdmin.register Elevator do
  require 'slack-notifier'
  require 'mysql2'
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  oldStatus = ""
  
   permit_params :serial_number, :model, :building_type, :status, :commission_date, :last_inspection_date, :certificate_of_inspection, :information, :notes, :column_id

   before_update do
      oldStatus = Elevator.find(self.params['id']).status
   end
   after_update do
      if oldStatus != self.params['elevator']['status']
        binding.pry
        notifier = Slack::Notifier.new ENV['slack_webhook']
        notifier.ping "The Elevator #{self.params['id']} with Serial Number #{self.params['elevator']['serial_number']} changed status from #{oldStatus} to #{self.params['elevator']['status']}"
      end
   end
    
    #
  # or
  #
  #  permit_params do
    #  permitted = [:serial_number, :model, :building_type, :status, :commission_date, :last_inspection_date, :certificate_of_inspection, :information, :notes, :column_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  #  end
  
end
