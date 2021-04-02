# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "Alex", email: "Alex@email.com", password: "123456") 
user2 = User.create(username: "Billie", email: "Billie@mail.net", password: "password") 
user3 = User.create(username: "Sam", email: "Sam@shemail.edu", password: "wittypun") 

user1.museums << Museum.create(name: "Louvre", location: "Paris")
user2.museums << Museum.create(name: "Smithsonian", location: "Washington DC")
user3.museums << Museum.create(name: "Guggenheim", location: "Bilbao")

Piece.create(user_id: 1, museum_id: 1, title: "Mona Lisa", artist: "Leonardo Da Vinci", description: "portrait of Mona Lisa")
Piece.create(user_id: 1, museum_id: 1, title: "The Girl with a Pearl Earring", artist: "Johannes Vermeer", description: "portrait of an unknown woman")
Piece.create(user_id: 2, museum_id: 2, title: "Guernica", artist: "Pablo Picasso", description: "anti_war painting")
Piece.create(user_id: 2, museum_id: 2, title: "The Starry Night", artist: "Vincent Van Gogh", description: "painting of the night sky")
Piece.create(user_id: 3, museum_id: 3, title: "American Gothic", artist: "Grant Wood", description: "painting of a farmer and his wife")
Piece.create(user_id: 3, museum_id: 3, title: "The Scream", artist: "Edvard Munch", description: "painting of a screaming person")

