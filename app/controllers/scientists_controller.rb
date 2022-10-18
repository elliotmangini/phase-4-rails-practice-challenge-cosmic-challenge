class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    # has_many :missions

    def index
        @scientists = Scientist.all
        render json: @scientists, status: :ok
    end

    def show
        render json: find_scientist, status: :ok
    end

    def create
        @scientist = Scientist.new(scientist_params)
        if @scientist.save
            render json: @scientist, status: :created
        else
            render json: @scientist.errors, status: :unprocessable_entity
        end
    end

    def update
        @scientist = find_scientist.update(scientist_params)
        if @scientist
            render json: find_scientist, status: :accepted
        else
            render json: find_scientist.errors, status: :unprocessable_entity
        end
    end

    def destroy
        render json: find_scientist.destroy
    end

    private

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_not_found_response
        render json: { error: 'Scientist not found' }, status: :not_found
    end

    # def render_unprocessable_entity_response(invalid)
    #     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    # end
end
