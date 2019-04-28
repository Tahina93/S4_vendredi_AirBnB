# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#destroy_all

City.destroy_all
User.destroy_all
Accomodation.destroy_all
Booking.destroy_all

puts "Base de donnée vide"
puts "-------------------------------------------------------"
puts " "

puts "-------------------------------------------------------"
puts "Here are all the cities created"
puts "-------------------------------------------------------"
puts " "
10.times do 
  city = City.create!(
  	name: Faker::Movies::HarryPotter.location,
  	zip_code: Faker::Base.regexify(/[0-8][0-9][0-9]{3}/))
  puts "#{city.name}"	
end

puts "-------------------------------------------------------"
puts "Here are all the users created"
puts "-------------------------------------------------------"
puts " "
20.times do 
  user = User.create!(
  	email: Faker::Internet.email,
  	phone_number: Faker::Base.regexify(/^0[1-9](\d{2}){4}$/),
  	description: Faker::Lorem.sentence(20))
  puts "#{user.email}"
end

puts "-------------------------------------------------------"
puts "Here are alle the accomodations created"
puts "-------------------------------------------------------"
puts " "
50.times do 
  acc = Accomodation.create!(
  	available_beds: rand(1..6),
  	price: rand(20..150),
  	description: Faker::Lorem.paragraph_by_chars(150, false),
  	has_wifi: [true, false].sample,
  	welcome_message: Faker::Lorem.sentence(10),
  	city: City.all.sample,
  	owner: User.all.sample)
  puts "#{acc.id} in #{acc.city.name}"
end

#puts "Here are all the bookings created"
puts "-------------------------------------------------------"
puts "Bookings "
puts "-------------------------------------------------------"
puts " "
start_d = Date.new(rand(2015..2020), rand(1..12), rand(1..28))
100.times do
  b = Booking.new(
  	start_date: start_d,
  	end_date: start_d + rand(1..10).day,
    rented_accomodation: Accomodation.all.sample,
    guest: User.all.sample)

  if b.valid?
  	b.save
  	puts "#{b.rented_accomodation.id} is booked by #{b.guest.id}"
  else
  	puts "This accomodation is not available between those dates."
  end
  
end
