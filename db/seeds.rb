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
