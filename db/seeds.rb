# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Circle.find_or_create_by(name: 'Kraków', code: 'KRK')
Circle.find_or_create_by(name: 'Warszawa', code: 'WAW')
Circle.find_or_create_by(name: 'Trójmiasto', code: '3M')
Circle.find_or_create_by(name: 'Śląsk', code: 'ŚLĄ')
Circle.find_or_create_by(name: 'Tarnów', code: 'TAR')
Circle.find_or_create_by(name: 'Poznań', code: 'PZN')
Circle.find_or_create_by(name: 'Łomianki', code: 'ŁOM')
Circle.find_or_create_by(name: 'Bochnia', code: 'BOC')
Circle.find_or_create_by(name: 'Berlin', code: 'BER')
Circle.find_or_create_by(name: 'Wrocław', code: 'WRO')
Circle.find_or_create_by(name: 'Łódź', code: 'ŁDŹ')

circles = Circle.count

(1..10).with_progress do |n|
  user = User.find_or_initialize_by(email: "user#{n}@example.com")
  user.password = user.password_confirmation = 'password'
  user.save

  profile = Profile.find_or_create_by(user: user)
  profile.remote_photo_url = 'http://lorempixel.com/400/400/'
  profile.fullname = Faker::Name.name
  profile.bio = Faker::Lorem.paragraph
  profile.activity = Faker::Company.name
  profile.circle_id = rand(1..circles)
  profile.save
end

(1..5).with_progress do |n|
  heroine = Heroine.find_or_create_by(id: n)
  heroine.remote_photo_url = 'http://lorempixel.com/400/400/'
  heroine.fullname = Faker::Name.name
  heroine.bio = Faker::Lorem.paragraph
  heroine.activity = Faker::Company.name
  heroine.circle_id = rand(1..circles)
  heroine.save
end
