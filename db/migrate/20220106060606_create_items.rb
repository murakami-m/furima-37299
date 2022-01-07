class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,              null: false
      t.text    :comment,            null: false
      t.integer :category_id,        null: false
      t.integer :situation_id,       null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :days_to_ship_id,    null: false
      t.integer :price,              null: false
      t.integer :user_id,            null: false
      t.timestamps
    end
  end
end
