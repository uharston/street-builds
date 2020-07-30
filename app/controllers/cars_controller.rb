class CarsController < ApplicationController
    before_action :check_user

    def index
    
        @cars = Car.all 
    end 

    def new 
        @car = Car.new 
    end 

    def create 
        car = current_user.owned_cars.create(car_params)
        if car.valid? 
            redirect_to car_path(car)
        else 
            flash[:errors] = car.errors.messages
            redirect_to new_car_path 
        end 
    end 

    def show 
        locate_car
    end 

    def edit 
        locate_car
    end 

    def update 
        locate_car.update(car_params)
        if @car.valid? 
            redirect_to car_path(@car)
        else 
            flash[:errors] = @car.errors.messages
            redirect_to edit_car_path(@car) 
        end 
    end 

    def destroy 
        locate_car.delete
        redirect_to cars_path 
    end 

    private 

    def locate_car 
        @car = Car.find(params[:id])
    end 

    def car_params 
        params.require(:car).permit(:year, :make, :model, :engine, :drivetrain, :suspension, :wheels_and_tires)
    end 

end