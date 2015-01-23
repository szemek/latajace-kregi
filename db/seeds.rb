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

(1..10).with_progress do |n|
  user = User.find_or_initialize_by(email: "user#{n}@example.com")
  user.password = user.password_confirmation = 'password'
  user.save

  profile = Profile.find_or_initialize_by(user: user)
  if profile.new_record?
    profile.remote_photo_url = 'http://lorempixel.com/400/400/'
    profile.fullname = Faker::Name.name
    profile.bio = Faker::Lorem.paragraph
    profile.activity = Faker::Company.name
    profile.circle_id = circles_ids.sample
    profile.save
  end
end

(1..5).with_progress do |n|
  heroine = Heroine.find_or_initialize_by(id: n)
  if heroine.new_record?
    heroine.remote_photo_url = 'http://lorempixel.com/400/400/'
    heroine.fullname = Faker::Name.name
    heroine.bio = Faker::Lorem.paragraph
    heroine.activity = Faker::Company.name
    heroine.circle_id = circles_ids.sample
    heroine.save
  end
end

(1..5).with_progress do |n|
  organizer = Organizer.find_or_initialize_by(id: n)
  if organizer.new_record?
    organizer.remote_photo_url = 'http://lorempixel.com/400/400/'
    organizer.fullname = Faker::Name.name
    organizer.bio = Faker::Lorem.paragraph
    organizer.activity = Faker::Company.name
    organizer.circle_id = circles_ids.sample
    organizer.save
  end
end

tags = YAML.load_file(Rails.root.join('lib/seeds/tags.yml'))
tags.with_progress.each do |tag_name|
  Tag.find_or_create_by(name: tag_name)
end
