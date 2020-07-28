class CarBuildsController < ApplicationController

    def index
        check_user 
        @car_builds = CarBuild.all 
    end 

    def new 
        check_user 
        @car_build = CarBuild.new 
    end 

    def create 
        binding.pry 
        car_build = CarBuild.create(car_build_params)
        if car_build.valid? 
            redirect_to car_build_path(car_build)
        else 
            redirect_to new_car_build_path 
        end 
    end 

    def show 
        locate_car_build
    end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 

    private 

    def locate_car_build 
        @car_build = CarBuild.find(params[:id])
    end 

    def car_build_params 
        params.require(:car_build).permit(:year, :make, :model, :engine, :drivetrain, :suspension, :wheels_and_tires)
    end 

end