require 'rails_helper'

RSpec.describe BuyShip, type: :model do
  describe '購入先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_ship = FactoryBot.build(:buy_ship, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buy_ship).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @buy_ship.building_name = ''
        expect(@buy_ship).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @buy_ship.post_code = ''
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @buy_ship.post_code = '1234567'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1では保存できない' do
        @buy_ship.prefecture_id = 1
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_ship.municipality = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_ship.address = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberがハイフンを含んでいたら保存できないこと' do
        @buy_ship.telephone_number = '090-1234-5678'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephon_numberが全角数字だと保存できないこと' do
        @buy_ship.telephone_number = '０９０１２３４５６７８'
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空だと保存できないこと' do
        @buy_ship.token = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_ship.user_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_ship.item_id = nil
        @buy_ship.valid?
        expect(@buy_ship.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
