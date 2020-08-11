class PurchasesController < ApplicationController
  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    @purchase.save
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(
      :zip_code,
      :prefecture_id,
      :city,
      :house_number,
      :property_name,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
