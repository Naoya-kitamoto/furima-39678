class OrdersController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end
  def create
    @purchase_address = PurchaseAddress.new(parchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :sender_id, :municipalities, :street_address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
