module Api
  class PlantsController < Api::BaseController
    private
      def plant_params
        params.require(:plant).permit(:name, :description)
      end

      def query_params
        params.permit(:name, :description)
      end

  end
end
