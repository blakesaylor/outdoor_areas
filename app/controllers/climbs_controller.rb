class ClimbsController < ApplicationController
    def index
        @climbs = Climb.all
    end

    def show
        @climb = Climb.find(params[:id])
    end

    def new
    end

    def create
        @area = Climb.find(params[:id])
        @area.climbs.create(climb_params)
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