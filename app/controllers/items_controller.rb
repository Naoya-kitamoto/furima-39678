class ItemsController < ApplicationController
  before_action :move_to_log_in, only: [:new, :edit]
  before_action :move_to_top_page, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_out_item, only: :edit
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :sender_id, :delivery_charge_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_log_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_top_page
    set_item
    return unless user_signed_in? && current_user.id != @item.user_id

    redirect_to root_path
  end

  def sold_out_item
    return unless @item.purchase.present?

    redirect_to root_path
  end
end
