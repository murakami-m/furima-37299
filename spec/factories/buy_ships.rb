FactoryBot.define do
  factory :buy_ship do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token { 'abc' }
  end
end
