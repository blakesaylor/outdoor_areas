class AreasController < ApplicationController
    def index
        @areas = Area.all.sort_by_created_datetime
    end

    def show
        @area = Area.find(params[:id])
    end

    def show_area_climbs
        @area = Area.find(params[:id])
        @climbs = @area.climbs
    end
end