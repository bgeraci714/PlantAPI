module Api
  class PlantsController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_plant, only: [:destroy, :show, :update]
    respond_to? :json
    skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

    private
      def plant_params
        params.require(:plant).permit(:name, :description)
      end

      def set_plant
        @plant = Plant.find(params[:id])
      end

    public
      # POST /api/plants
      def create
        @plant = Plant.new(plant_params)

        if @plant.save
          render :json => @plant, status: :created
        else
          render json: @plant.errors, status: :unproccessable_entity
        end
      end

      # DELETE /api/plants/1
      def destroy
        @plant.destroy
        head :no_content
      end

      # GET /api/plants
      def index
        @plants = Plant.all
        render json: @plants
      end


      # GET /api/plants/1
      def show
        render json: @plant
      end

      # PATCH/PUT
      def update
        if @plant.update(plant_params)
          render :show
        else
          render json: @plant.errors, status: :unprocessable_entity
        end
      end
  end
end
