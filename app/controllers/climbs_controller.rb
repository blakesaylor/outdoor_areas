class ClimbsController < ApplicationController
    def index
        @climbs = Climb.all
    end
end