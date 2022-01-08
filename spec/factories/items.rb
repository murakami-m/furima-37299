FactoryBot.define do
  factory :item do
    title              { Faker::Lorem.sentence }
    comment            { Faker::Lorem.sentence }
    category_id        { 2 }
    situation_id       { 2 }
    delivery_charge_id { 2 }
    prefecture_id      { 2 }
    days_to_ship_id    { 2 }
    price              { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
