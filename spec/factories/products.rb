FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    sequence(:sku) { |n| "#{Faker::Code.npi}#{n}".to_i }
    category { Faker::Commerce.department }
  end
end