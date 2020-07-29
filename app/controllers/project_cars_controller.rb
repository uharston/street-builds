class ProjectCarsController < ApplicationController
    before_action :check_user

    def index
        @project_cars = ProjectCar.all 
    end 

    def new 
        @project_car = ProjectCar.new 
    end 

    def create 
        project_car = current_user.owned_project_cars.create(project_car_params)
        if project_car.valid? 
            redirect_to project_car_path(project_car)
        else 
            redirect_to new_project_car_path 
        end 
    end 

    def show 
        locate_project_car
    end 

    def edit 

    end 

    def update 

    end 

    def destroy 

    end 

    private 

    def locate_project_car 
        @project_car = ProjectCar.find(params[:id])
    end 

    def project_car_params 
        params.require(:project_car).permit(:year, :make, :model, :engine, :drivetrain, :suspension, :wheels_and_tires)
    end 

end