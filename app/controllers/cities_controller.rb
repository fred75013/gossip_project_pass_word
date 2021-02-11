class CitiesController < ApplicationController
    def index
    end

    def show
      @cities = City.find(params[:id])
    end
end
