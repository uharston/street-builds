class BoardsController < ApplicationController
  before_action :check_user

  def index
    @user = User.find(params[:user_id])
  end


  def show  
    locate_board
  end

  def edit 
    if locate_board.user != current_user
      redirect_to cars_path
    end
  end

  def update
    locate_board.update(board_param)
    if @board.valid? 
      redirect_to board_path(locate_board)
    else 
      flash[:errors] = @board.errors.full_messages.to_sentence
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
