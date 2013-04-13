FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'password1234'
    password_confirmation 'password1234'
  end

  factory :hotspot do
    sequence(:name) { |n| "hotspot_#{n}" }
    category 'Computers & Electronics'
    user
  end
end

