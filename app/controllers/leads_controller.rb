class LeadsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        @lead = Lead.create!(
            contact_name: params[:contact_name],
            company_name: params[:company_name],
            email: params[:email],
            phone: params[:phone],
            project_name: params[:project_name],
            project_description: params[:project_description],
            department: params[:department],
            message: params[:message],
            attached_file: image?,
            filename: image_name?
        )

        redirect_to('/index')
    end

    private 

    def image?
        params[:attached_file].read if params[:attached_file]
    end
    def image_name?
        params[:attached_file].original_filename if params[:attached_file]
    end
end

