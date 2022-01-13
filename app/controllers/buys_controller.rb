class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @buy_ship = BuyShip.new
    @item = Item.find(params[:item_id])
    if @item.buy != nil
      redirect_to root_path
    elsif @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @buy_ship = BuyShip.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_ship.valid?
      pay_item
      @buy_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_ship).permit(:post_code, :prefecture_id, :municipality, :address, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
        card: buy_params[:token],
        currency: 'jpy'
    )
  end

end