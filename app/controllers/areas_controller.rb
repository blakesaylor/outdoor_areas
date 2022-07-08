class AreasController < ApplicationController
    def index
        @areas = Area.sort_by_created_datetime
    end

    def show
        @area = Area.find(params[:id])
    end

    def show_area_climbs
        @area = Area.find(params[:id])
        @climbs = @area.climbs
    end

    def new
    end

    def create
        Area.create(area_params)
        redirect_to '/areas'
    end

    private
    def area_params
        params.permit(  :name, 
                        :state, 
                        :rock_climbing, 
                        :elevation, 
                        :latitude, 
                        :longitude)
    end
end