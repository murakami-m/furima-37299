class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  
  with_options presence: true do
    validates :coment
    validates :category_id, numericality: { other_than: 1 }
    validates :situation_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
    validates :pryce, numericality: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :user_id
  end
end