class PurchasesController < ApplicationController
  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def pay_item
    @item = Item.find_by(id: params[:id])
    Payjp.api_key = "sk_test_738a390c43c2f014e0cb79f6"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: 5000,
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end

  def purchase_params
    params.permit(
      :zip_code,
      :prefecture_id,
      :city,
      :house_number,
      :property_name,
      :phone_number,
      :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
