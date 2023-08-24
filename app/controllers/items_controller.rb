class ItemsController < ApplicationController
  before_action :move_to_log_in, only: :new
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :sender_id, :delivery_charge_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_log_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
