class PinsController < ApplicationController
  def index
  end

  def new
    binding.pry 
    @pin = Pin.new
    @pin.build_board
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def delete
  end
end
