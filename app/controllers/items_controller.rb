class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all
  end

  def show
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
