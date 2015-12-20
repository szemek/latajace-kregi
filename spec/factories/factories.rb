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

  factory :circle do
    sequence(:name) { |n| "Krąg #{n}" }
    sequence(:code) { |n| "KOD #{n}" }
    sequence(:position) { |n| n }
  end

  factory :event do
    sequence(:name) { |n| "Wydarzenie #{n}" }
    starting_at DateTime.tomorrow
    association :circle
  end
end
