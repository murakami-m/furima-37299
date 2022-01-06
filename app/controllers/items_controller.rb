class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path

  private

  def item_params
    params.require(:item).permit(:image, :title, :comment, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end

