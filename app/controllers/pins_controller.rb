class PinsController < ApplicationController
  def index
  end

  def new
    @pin = Pin.new 
    @boards = current_user.boards
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
