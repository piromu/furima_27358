FactoryBot.define do
  factory :item do
    image
    name{'test'}
    introduction{'test'}
    condition{1}
    price{9999999}
    delivery_fee{1}
    association :user
    
    trait :image do
      image { fixture_file_upload(Rails.root.join('spec/fixtures/lea-232-black-lotus.jpg')) }
    end
  end
end 