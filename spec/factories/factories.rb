FactoryGirl.define do
  factory :krakow, class: Circle do
    name 'Kraków'
    code 'KRK'
    position 1
  end

  factory :user do
    fullname Faker::Name.name
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
