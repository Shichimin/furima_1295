class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end
end
