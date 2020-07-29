class BoardsController < ApplicationController
  def index
  end

  def new
    locate_project_car
    @board = Board.new 
  end

  def create
    locate_project_car
    b = @project_car.boards.build(title: params[:title])
    b.project_cars << @project_car
    b.user = current_user
    b.save
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
