class BoardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    locate_car
    @board = Board.new 
  end

  def create
    new_board = current_user.boards.build(title: params[:title])
    new_pins = new_board.pins.build
    new_pins.car = locate_car
    new_pins.save
    redirect_to user_path(current_user)
  end

  def show  
    locate_board
  end

  def edit 
    locate_board
  end

  def update
    locate_board.update(board_param)
    redirect_to board_path(locate_board)
  end

  def destroy
  end

  private 

  def locate_car
    @car = Car.find(params[:id])
  end 

  def locate_board 
    @board = Board.find(params[:id])
  end 

  def board_param
    params.require(:board).permit(:title)
  end 
end
