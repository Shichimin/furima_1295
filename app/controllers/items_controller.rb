class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    # items/1
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
