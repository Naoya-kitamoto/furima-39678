class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create]
  before_action :back_to_top_page, only: :index
  before_action :back_to_log_in, only: :index
  before_action :sold_out_items, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :sender_id, :municipalities, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def back_to_top_page
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def back_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def sold_out_items
    if @item.purchase.present?
      redirect_to root_path
    end
  end
end
