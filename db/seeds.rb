# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fighter.delete_all

2.times do |i|
  Fighter.create!(name: "Combattant #{i + 1}", health: 100 * (i + 1), attack: 10)
end

puts '2 Fighters created'