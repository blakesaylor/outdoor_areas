class AreaClimbsController < ApplicationController
    def index
        area = Area.find(params[:area_id])
        @climbs = area.climbs
    end
end