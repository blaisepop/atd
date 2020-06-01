# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroy all"
Playlist.destroy_all
Track.destroy_all
Dj.destroy_all

puts "Creating Dj's"
alex = Dj.create!(
  username: "Dj Alex",
  email:      "alex@gmail.com",
  password:   "azerty"
)

puts "Creating playlist"
playlist = Playlist.create!(
  name: "Party rock",
  room_code: "2020",
  dj: alex
)

puts "Creating tracks"
track = Track.create!(
  title: "Blinding lights",
  artist: "The Weeknd",
  album: "After hours",
  duration: 200000,
  votes: 5
)
