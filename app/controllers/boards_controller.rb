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
    new_pin = new_board.pins.build
    new_pin.car = locate_car
    new_pin.save
    if new_pin.valid? 
      redirect_to user_path(current_user)
    else 
      flash[:errors] = @board.errors.messages
      redirect_to edit_board_path(@board)
    end 
  end

  def show  
    locate_board
  end

  def edit 
    locate_board
  end

  def update
    locate_board.update(board_param)
    if @board.valid? 
      redirect_to board_path(locate_board)
    else 
      flash[:errors] = @board.errors.messages
      redirect_to edit_board_path(@board)
    end 
  end

  def destroy
    locate_board.delete 
    redirect_to user_boards_path(current_user)
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
