# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fighter.delete_all
User.delete_all

3.times do |i|
  user = User.new(email: FFaker::Internet.email, password: 'lalala')
  user.save
  
  Fighter.create!(name: FFaker::Name.name[2..12], health: rand(200..400), attack: rand(10..20), user: user)
end

puts '3 users created with 1 Fighter associated each'

Equipment.create!(name: "Epée", attack: 10, armor: 0)
Equipment.create!(name: "Armure", attack: 0, armor: 80)
Equipment.create!(name: "Bouclier", attack: 5, armor: 40)

puts "3 equipments created"