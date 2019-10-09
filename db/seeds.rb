# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fighter.delete_all

2.times do |i|
  user = User.new(email: "example#{i + 1}@gmail.com", password: 'lalala')
  user.save
  
  Fighter.create!(name: "Combattant #{i + 1}", health: 100 * (i + 1), attack: 10, user: user)
end

puts '2 users created with 1 Fighter associated each'