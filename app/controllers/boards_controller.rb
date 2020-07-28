class BoardsController < ApplicationController
  def index
  end

  def new
    locate_project_car
    @board = Board.new 
  end

  def create
    binding.pry 
    locate_project_car
    @build = @project_car.boards.build(title: params[:title])
    @build.project_car_admirer = current_user
    @build.save
    redirect_to user_path(current_user)
  end

  def show
    locate_board
  end

  def edit
  end

  def update
  end

  def delete
  end

  private 

  def locate_project_car
    @project_car = ProjectCar.find(params[:id])
  end 

  def locate_board 
    @board = Board.find(params[:id])
  end 
end
