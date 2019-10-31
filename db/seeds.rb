# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users') #commande pour reset l'id 
Gossip.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('gossips') #commande pour reset l'id 
City.all.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cities')

10.times do 
	c = City.create(name: Faker::Movies::LordOfTheRings.location)
p c 
end

puts "City Done"
20.times do
	u = User.create(name: Faker::TvShows::GameOfThrones.character,email: Faker::Internet.email,
	description: Faker::TvShows::GameOfThrones.house,
	birthdate: (rand(Date.civil(1950, 1, 1)..Date.civil(2005, 12, 31)).to_s), city_id: rand(1..10))
		p u
end

puts "User DONE"

30.times do
	g = Gossip.create(content: Faker::TvShows::GameOfThrones.quote, title: Faker::TvShows::GameOfThrones.dragon,
	date: (rand(Date.civil(2019, 1, 1)..Date.civil(2020, 12, 31)).to_s),
	user_id: rand(1..20))
		p g
end

puts "Gossip DONE"

