class PurchasesController < ApplicationController
  before_action :set_item, only: [:show, :create, :pay_item]

  def show
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.purchase.present?
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
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

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
