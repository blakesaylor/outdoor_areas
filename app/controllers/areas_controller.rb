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
        Area.create(name: params[:name],
                    state: params[:state],
                    rock_climbing: params[:rock_climbing],
                    elevation: params[:elevation],
                    latitude: params[:latitude],
                    longitude: params[:longitude]    
                )
        redirect_to '/areas'
    end
end