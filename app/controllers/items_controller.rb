class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.coreate(item_params)
    # ↑履歴を残すための空commit
  end

  def edit
  end

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :image,
      :description,
      :price,
      :category_id,
      :shipping_origin_id,
      :condition_id,
      :shipping_burden_id,
      :estimated_shipping_date_id
    ).merge(user_id: current_user.id)
  end
end
