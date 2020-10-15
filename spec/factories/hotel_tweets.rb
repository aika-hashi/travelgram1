FactoryBot.define do
  factory :hotel_tweet do
    
        image {Faker::Lorem.sentence}
        title {Faker::Lorem.sentence}
        text {Faker::Lorem.sentence}
        local {Faker::Lorem.sentence}
        area_id{"2"}
        price{"2000"}
        association :user   
      
    
    
  end
end
