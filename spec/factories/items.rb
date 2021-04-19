FactoryBot.define do
  factory :item do
    
    
        title           { Faker::Commerce.product_name }
        itemtext           { Faker::Lorem.sentence }
        condition_id      { 1 }
        category_id          { 1 }
        postage_id       { 1 }
        prefecture_id           { 1 }
        shipping_day_id         { 1 }
        price            { 1000 }
      
        after(:create) do |item|
          create_list(:image, 3, item: item)

          association :user 
        end
    
      end
    
    end