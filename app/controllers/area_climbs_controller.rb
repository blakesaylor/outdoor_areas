class AreaClimbsController < ApplicationController
    def index
        @area = Area.find(params[:area_id])
        @climbs = @area.climbs
    end

    def new
        @area = Area.find(params[:area_id])
    end

    def create
        @area = Area.find(params[:area_id])
        @area.climbs.create(climb_params)
        redirect_to "/areas/#{@area.id}/climbs"
    end

    private
    def climb_params
        params.permit(  :name, 
                        :lead, 
                        :sport, 
                        :trad, 
                        :top_rope, 
                        :grade,
                        :pitches)
    end
end