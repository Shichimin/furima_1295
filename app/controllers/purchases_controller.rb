class PurchasesController < ApplicationController
  def new
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(
      :zip_code,
      :prefecture_id,
      :city,
      :house_number,
      :property_name,
      :phone_number,
      :user_id,
      :item_id)
  end
end
