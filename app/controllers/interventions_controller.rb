class InterventionsController < ApplicationController

    def create
        @intervention = Intervention.all

        Intervention.create(
            author: params[:author],
            result: params[:result],
            report: params[:report],
            status: params[:status],
            customer_id: params[:customer_id],
            building_id: params[:building_id],
            battery_id: params[:battery_id],
            column_id: params[:column_id],
            elevator_id: params[:elevator_id]
        )

        redirect_to('/intervention')
    end
    
end