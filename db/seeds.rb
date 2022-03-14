# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "ajri@test.com", username: "ajrisylhasi", password: "1234567@aA")
Place.create(id: 1, name: "Library of Social Studies", category: "Library", lat: 47.54430723474201, lng: 21.641711739114772)
Place.create(id: 2, name: "Life Sciences Library and National Library", category: "Library", lat: 47.55592932862076, lng: 21.62123383328685)
Place.create(id: 3, name: "Technical University of Debrecen", category: "Campuss", lat: 47.536461200545624, lng: 21.64103399326681)
Place.create(id: 4, name: "Train Station", category: "Transportation Station", lat: 47.5205029, lng: 21.6284862)
Place.create(id: 5, name: "Main Building", category: "Education Building", lat: 47.55360957469289, lng: 21.621530698232196)