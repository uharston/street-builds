class PinsController < ApplicationController
  before_action :check_user

  def index
    if params[:board_id]
      @board = Board.find(params[:board_id])
      @pins = @board.pins
    else 
      @pins = Pin.all 
    end
  end

  def new
    @pin = Pin.new
    @pin.build_board
    @pin.build_car
  end

  def create
    if params[:pin][:board_attributes][:title].present?
      new_board = current_user.boards.build(title: params[:pin][:board_attributes][:title])
      new_pin = new_board.pins.build(note: params[:pin][:board_attributes][:note])
      new_pin.car = locate_car 
      new_pin.save
      redirect_to board_path(new_pin.board)
    elsif params[:pin][:board_id]
      found_board = Board.find(params[:pin][:board_id])
      new_pin = found_board.pins.build(note: params[:pin][:note])
      new_pin.car = locate_car #
      new_pin.save
      redirect_to board_path(new_pin.board)
    else 
      flash[:errors] = "Board title can't be blank"
      # render 'pins/new' 
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
    if @pin.valid? 
      redirect_to board_path(@pin.board)
    else 
      flash[:errors] = @pin.errors.full_messages.to_sentence
      redirect_to edit_board_path(@pin.board)
    end
  end



  def destroy
     locate_pin
     board = @pin.board
     @pin.delete
     redirect_to board_path(board)
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
