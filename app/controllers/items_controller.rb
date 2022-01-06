class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = Item.includes(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :comment, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end

