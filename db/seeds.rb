# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Circle.find_or_create_by(name: 'Kraków')
Circle.find_or_create_by(name: 'Warszawa')
Circle.find_or_create_by(name: 'Trójmiasto')
Circle.find_or_create_by(name: 'Śląsk')
Circle.find_or_create_by(name: 'Tarnów')
Circle.find_or_create_by(name: 'Poznań')
Circle.find_or_create_by(name: 'Łomianki')
Circle.find_or_create_by(name: 'Bochnia')
Circle.find_or_create_by(name: 'Berlin')

(1..10).with_progress do |n|
  user = User.find_or_initialize_by(email: "user#{n}@example.com")
  user.password = user.password_confirmation = 'password'
  user.save

  profile = Profile.find_or_create_by(user: user)
  profile.remote_photo_url = 'http://lorempixel.com/400/400/'
  profile.fullname = Faker::Name.name
  profile.bio = Faker::Lorem.paragraph
  profile.activity = Faker::Company.name
  profile.save
end

(1..5).with_progress do |n|
  heroine = Heroine.find_or_create_by(id: n)
  heroine.remote_photo_url = 'http://lorempixel.com/400/400/'
  heroine.fullname = Faker::Name.name
  heroine.bio = Faker::Lorem.paragraph
  heroine.activity = Faker::Company.name
  heroine.save
end
