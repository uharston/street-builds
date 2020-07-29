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

    end 

  end

  def show
  end

  def update
  end

  def edit
  end

  def delete
  end

  private 

  def locate_car
    @car = Car.find(params[:car_id])
  end 


  def board_params 
    params.require(:pin).permit(board_attributes: [:title])
  end 
end
