# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Cleaning Database"
Restaurant.destroy_all

puts "Creating reviews and restuarants"
10.times do
  res = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone, category: %w[chinese italian japanese french belgian].sample)
  res.save
  5.times do
    Review.create(content: Faker::Restaurant.review, rating: rand(0..5), restaurant: res)
  end
end

puts "Seed Done"
