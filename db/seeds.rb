# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
circles = [
  { name: 'Kraków', code: 'KRK', position: 1 },
  { name: 'Warszawa', code: 'WAW', position: 2 },
  { name: 'Trójmiasto', code: '3M', position: 3 },
  { name: 'Śląsk', code: 'ŚLĄ', position: 4 },
  { name: 'Tarnów', code: 'TAR', position: 5 },
  { name: 'Poznań', code: 'PZN', position: 6 },
  { name: 'Łomianki', code: 'ŁOM', position: 7 },
  { name: 'Bochnia', code: 'BOC', position: 8 },
  { name: 'Berlin', code: 'BER', position: 9 },
  { name: 'Wrocław', code: 'WRO', position: 10 },
  { name: 'Łódź', code: 'ŁDŹ', position: 11 }
]

circles.each do |circle|
  Circle.find_or_create_by(circle.slice(:name)).update_attributes(circle)
end

circles_ids = Circle.pluck(:id)

(1..30).with_progress do |n|
  user = User.find_or_initialize_by(email: "user#{n}@example.com")
  user.password = user.password_confirmation = 'password'
  user.save

  user.fullname = Faker::Name.name
  user.bio = Faker::Lorem.paragraph
  user.activity = Faker::Company.name
  user.circle_id = circles_ids.sample
  user.save
end

tags = YAML.load_file(Rails.root.join('lib/seeds/tags.yml'))
tags.with_progress.each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end
