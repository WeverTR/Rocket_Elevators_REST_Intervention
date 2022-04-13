class InterventionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_employee

    def authenticate_employee
        if user_signed_in?
            if current_user.employee == nil
                flash[:alert] = "Error: Logged in user is not an employee!"
                redirect_to "/404"
            end
        else
            flash[:alert] = "Error: only employees can access this page!"
            redirect_to "/404"
        end
    end

    def get_buildings_by_customer
        @buildings = Building.where("customer_id = ?", params[:customer_id])
        respond_to do |format|
          format.json { render :json => @buildings }
        end
    end

    def building_search
        if params[:customer].present? && params[:customer].strip != ""
            @buildings = Building.where("customer_id = ?", params[:customer])
        else
            @buildings = Building.all
        end
    end

    def get_batteries_by_building
        @batteries = Battery.where("building_id = ?", params[:building_id])
        respond_to do |format|
            format.json { render :json => @batteries }
        end
    end
    
    def battery_search
        if params[:customer].present? && params[:customer].strip != ""
            @batteries = Battery.where("building_id = ?", params[:customer])
        else
            @batteries = Battery.all
        end
    end

    def get_columns_by_battery
        @columns = Column.where("battery_id = ?", params[:battery_id])
        respond_to do |format|
            format.json { render :json => @columns }
        end
    end
    
    def column_search
        if params[:customer].present? && params[:customer].strip != ""
            @columns = Column.where("customer_id = ?", params[:customer])
        else
            @columns = Column.all
        end
    end

    def get_elevators_by_column
        @elevators = Elevator.where("column_id = ?", params[:column_id])
        respond_to do |format|
            format.json { render :json => @elevators }
        end
    end
    
    def elevator_search
        if params[:customer].present? && params[:customer].strip != ""
            @elevator = Elevator.where("customer_id = ?", params[:customer])
        else
            @elevator = Elevator.all
        end
    end

    def create
        @intervention = Intervention.create(
            author: current_user.employee,
            result: params[:result],
            report: params[:report],
            status: params[:status],
            customer_id: params[:customer],
            building_id: params[:building],
            battery_id: params[:battery],
            column_id: params[:column],
            elevator_id: params[:elevator],
            employee_id: params[:employee]
        )

        # binding.pry
    # Your freshdesk domain
        # freshdesk_domain = 'codeboxx3795.freshdesk.com/helpdesk/tickets'
        freshdesk_domain = 'codeboxx3795'

        # It could be either your user name or api_key.
        api_key = ENV['FRESHDESK_API']

          if @intervention.author_id == nil
          @intervention.author_id = "n/a"
          end
          if @intervention.result == nil
          @intervention.result = "n/a"
          end
          if @intervention.report == nil
          @intervention.report = "n/a"
          end
          if @intervention.status == nil
          @intervention.status = "n/a"
          end
          if @intervention.customer_id == nil
          @intervention.customer_id = "n/a"
          end
          if @intervention.building_id == nil
          @intervention.building_id = "n/a"
          end
          if @intervention.battery_id == nil
          @intervention.battery_id = "n/a"
          end
          if @intervention.column_id == nil
          @intervention.column_id = "n/a"
          end
          if @intervention.elevator_id == nil
          @intervention.elevator_id = "n/a"
          end
          if @intervention.employee_id == nil
          @intervention.employee_id = "n/a"
          end

          json_payload = {
            status: 2,  
            priority: 1,
            "email": "rocketelevators123456@gmail.com",
            "type": "Incident",
            "subject": @intervention.report,
            "description": "Requestor #{@intervention.customer.company_contact_name} of #{@intervention.customer.company_name} 
                (building ID: #{@intervention.building_id}, column ID: #{@intervention.column_id}, 
                elevator ID: #{@intervention.elevator_id}), assigned to employee" + (!@intervention.employee.nil? ? @intervention.employee.first_name : "<UNASSIGNED>") + 
                " with the description: #{@intervention.report}" 
            }.to_json

    freshdesk_api_path = 'api/v2/tickets'

    freshdesk_api_url  = "https://#{freshdesk_domain}.freshdesk.com/#{freshdesk_api_path}"

    site = RestClient::Resource.new(freshdesk_api_url, api_key)

    begin
        response = site.post(json_payload, :content_type=>'application/json')
        puts "response_code: #{response.code} \n Location Header: #{response.headers[:location]}\n response_body: #{response.body}"
    rescue RestClient::Exception => exception
        puts 'API Error: Your request is not successful. If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id'
        puts "X-Request-Id : #{exception.response.headers[:x_request_id]}"
        puts "Response Code: #{exception.response.code} Response Body: #{exception.response.body} "
    end

    puts "@@@@@@@@@@@@@@@@@@@@@@WOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOW"
    puts site

        redirect_to('/intervention_search')
    end

end