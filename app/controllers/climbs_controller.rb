class ClimbsController < ApplicationController
    def index
        if params[:exact] != nil
            @climbs = Climb.filter_by_name_exact(params[:exact])
        else
            @climbs = Climb.all
        end
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

    def destroy
        Climb.destroy(params[:id])
        redirect_to '/climbs'
    end

    private
    def climb_params
        params.permit(  :name, 
                        :top_rope, 
                        :grade,
                        :pitches)
    end
end