FactoryGirl.define do
  factory :krakow, class: Circle do
    name 'Kraków'
    code 'KRK'
    position 1
  end

  factory :profile do
    fullname 'Anna Nowak'
    association :user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
  end
end
