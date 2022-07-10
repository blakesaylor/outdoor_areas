class ClimbsController < ApplicationController
    def index
        @climbs = Climb.all
    end

    def show
        @climb = Climb.find(params[:id])
    end

    def edit
        @climb = Climb.find(params[:id])
    end

    def update
        @climb = Climb.find(params[:id])
        @climb.update(climb_params)
        redirect_to "/climbs/#{@climb.id}"
    end

    private
    def climb_params
        params.permit(  :name, 
                        :top_rope, 
                        :grade,
                        :pitches)
    end
end