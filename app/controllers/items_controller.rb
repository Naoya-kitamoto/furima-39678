class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).parmit(:image, :item_name, :explanation, :category_id, :condition_id, :sender_id, :delivery_charge_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

end
