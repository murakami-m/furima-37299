class Item < ApplicationRecord
  with_options presence: true do
    validates :coment
    validates :category_id
    validates :situation_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :pryce
    validates :user_id
  end
end