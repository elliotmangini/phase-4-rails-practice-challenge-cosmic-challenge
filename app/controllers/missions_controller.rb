class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    # belongs_to :planet

    def create
        @mission = Mission.new(mission_params)
        if @mission.save
            render json: @mission.planet, status: :created
        else
            render json: @mission.errors, status: :unprocessable_entity
        end
    end

    private

    def find_mission
        @mission = Mission.find(params[:id])
    end

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    # def render_unprocessable_entity_response(invalid)
    #     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    # end

    
end
