FactoryBot.define do
  factory :item do
    item_name { 'アイテム' }
    item_description { 'アイテムです' }
    category_id { 2 }
    item_condition_id { 2 }
    shopping_fee_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
