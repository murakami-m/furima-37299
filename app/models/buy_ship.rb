class BuyShip
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Ship.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                telephone_number: telephone_number, buy_id: buy.id)
  end
end
  