class PinsController < ApplicationController
  def index
  end

  def new
    @pin = Pin.new
    @pin.build_board
    @pin.build_car
  end

  def create
    if params[:pin][:board_attributes][:title].present?
      new_board = current_user.boards.build(title: params[:pin][:board_attributes][:title])
      new_pins = new_board.pins.build(note: params[:pin][:board_attributes][:note])
      new_pins.car = locate_car #
      new_pins.save
      redirect_to user_path(current_user)
    elsif params[:pin][:board_id]
      found_board = Board.find(params[:pin][:board_id])
      new_pins = found_board.pins.build(note: params[:pin][:note])
      new_pins.car = locate_car #
      new_pins.save
      redirect_to user_path(current_user)
    else 
      flash[:errors] = "Board title can't be blank"
      redirect_to new_car_pin_path(locate_car)
    end
  end

  def show
  end

  def edit
    locate_pin
  end

  def update
    locate_pin.update(pin_param)
    redirect_to board_path(@pin.board)
  end



  def destroy
     locate_pin.delete
     redirect_to user_path(current_user)
  end

  private 

  def locate_car
    @car = Car.find(params[:car_id])
  end 

  def locate_pin 
    @pin = Pin.find(params[:id])
  end 

  def pin_param
    params.require(:pin).permit(:note)
  end 


  def board_params 
    params.require(:pin).permit(board_attributes: [:title])
  end 
end
