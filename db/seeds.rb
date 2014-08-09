# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
circles = [
  { name: 'Kraków', code: 'KRK' },
  { name: 'Warszawa', code: 'WAW' },
  { name: 'Trójmiasto', code: '3M' },
  { name: 'Śląsk', code: 'ŚLĄ' },
  { name: 'Tarnów', code: 'TAR' },
  { name: 'Poznań', code: 'PZN' },
  { name: 'Łomianki', code: 'ŁOM' },
  { name: 'Bochnia', code: 'BOC' },
  { name: 'Berlin', code: 'BER' },
  { name: 'Wrocław', code: 'WRO' },
  { name: 'Łódź', code: 'ŁDŹ' }
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
