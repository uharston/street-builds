class CarsController < ApplicationController
    before_action :check_user

    def index
        if params[:search].present? 
            @cars = Car.search_all_fields(params[:search].strip)
        else
            @cars = Car.all 
        end 
    end 

    def new 
        @car = Car.new 
    end 

    def create 
        @car = current_user.owned_cars.create(car_params)
        if @car.valid? 
            redirect_to car_path(@car)
        else 
            flash[:errors] = @car.errors.full_messages.to_sentence
            render :new
        end 
    end 

    def show 
        locate_car
    end 

    def edit
        locate_car
        if @car.owner != current_user 
            redirect_to cars_path
        end 
    end 

    def update 
        locate_car.update(car_params)
        if @car.valid? 
            redirect_to car_path(@car)
        else 
            flash[:errors] = @car.errors.full_messages.to_sentence
            render "cars/edit"
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
        params.require(:car).permit(:year, :make, :model, :engine, :drivetrain, :suspension_and_brakes, :wheels_and_tires, :images)
    end 

end