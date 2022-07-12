class AreaClimbsController < ApplicationController
    def index
        @area = Area.find(params[:area_id])
        if params[:sort] == 'alpha'
            @climbs = @area.climbs.alphabetical
        elsif params[:minimum] != nil
            @climbs = @area.climbs.filter_by_pitches(params[:minimum])
        else
            @climbs = @area.climbs
        end
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
                        :top_rope, 
                        :grade,
                        :pitches)
    end
end