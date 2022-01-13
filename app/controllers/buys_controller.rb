class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @buy_ship = BuyShip.new
    if !@item.buy.nil? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @buy_ship = BuyShip.new(buy_params)
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
    params.require(:buy_ship).permit(:post_code, :prefecture_id, :municipality, :address, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end