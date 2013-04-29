FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'password1234'
    password_confirmation 'password1234'
  end

  factory :hotspot do
    sequence(:name) { |n| "hotspot_#{n}" }
    category 'Computers & Electronics'
  end

  factory :landing do
    sequence(:title) { |n| "landing_#{n}" }
    hotspot
  end

  factory :editorship do
    user

    factory :hotspot_editorship do
      association :editable, :factory => :hotspot
    end
  end
end

