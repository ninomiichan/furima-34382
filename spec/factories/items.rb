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
      
        after(:build) do |item|
          item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        end
    
      end
    
    end