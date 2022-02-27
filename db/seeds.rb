# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(email: "ajri@test.com", username: "ajrisylhasi", password: "1234567@aA")
user2 = User.create(email: "ajri2@test.com", username: "ajrisylhasi2", password: "1234567@aA")
place1 = Place.create(name: "Kassai Library", category: "Library")
event1 = Event.create(name: "Kassai Library Party", place_id: place1.id)
