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
User.destroy_all

puts "Creating User's"
alex = User.create!(
  username: "Dj Alex",
  email:      "alex@gmail.com",
  password:   "azerty"
)

peter = User.create!(
  username: "MC Peter",
  email:      "PeterMC@gmail.com",
  password:   "thebestalive123"
)

benson = User.create!(
  username: "Dj Benson",
  email:      "Benson@gmail.com",
  password:   "UserKingdom"
)

blaise = User.create!(
  username: "Musical Maestro",
  email:      "BlaiseP@gmail.com",
  password:   "blaise123"
)

puts "Creating playlist"
playlist = Playlist.create!(
  name: "Party rock",
  room_code: "2020202",
  user: alex
)

playlist1 = Playlist.create!(
  name: "Oldies",
  room_code: "007007",
  user: peter
)

playlist2 = Playlist.create!(
  name: "Renens Wedding",
  room_code: "929345",
  user: benson
)

playlist3 = Playlist.create!(
  name: "Sing along",
  room_code: "1112111",
  user: blaise
)

puts "Creating tracks"
track = Track.create!(
  title: "Blinding lights",
  artist: "The Weeknd",
  album: "After hours",
  duration: 200000,
  spotify_uri:"spotify:track:0VjIjW4GlUZAMYd2vXMi3b",
)

track1 = Track.create!(
  title: "That's Life",
  artist: "Frank Sinatra",
  album: "That's Life",
  duration: 187000,
  spotify_uri:"spotify:track:4dt6XKr0xKdPzjFhwB8dBm",
)

track2 = Track.create!(
  title: "Tiny Dancer",
  artist: "Elton John",
  album: "Madman Across The Water",
  duration: 377000,
  spotify_uri:"spotify:track:2TVxnKdb3tqe1nhQWwwZCO",
)

track3 = Track.create!(
  title: "The Chain",
  artist: "Fleetwood Mac",
  album: "Rumours (Super Deluxe)",
  duration: 270000,
  spotify_uri:"spotify:track:5e9TFTbltYBg2xThimr0rU",
)

track4 = Track.create!(
  title: "Blackbird",
  artist: "The Beatles",
  album: "The Beatles (Remastered)",
  duration: 138000,
  spotify_uri:"spotify:track:5jgFfDIR6FR0gvlA56Nakr",
)

track5 = Track.create!(
  title: "Don't Look Back In Anger",
  artist: "Oasis",
  album: "(What's the Story) Morning Glory?",
  duration: 290000,
  spotify_uri:"spotify:track:3ZE3wv8V3w2T2f7nOCjV0N",
)

track6 = Track.create!(
  title: "Life on Mars?",
  artist: "David Bowie",
  album: "Hunky Dory",
  duration: 256000,
  spotify_uri:"",
)

track7 = Track.create!(
  title: "Killer Queen",
  artist: "Queen",
  album: "Sheer Heart Attack",
  duration: 180000,
  spotify_uri:"spotify:track:4cIPLtg1avt2Jm3ne9S1zy",
)

track8 = Track.create!(
  title: "Don't Let Me Be Misunderstood",
  artist: "The Animals",
  album: "The Singles Plus",
  duration: 146000,
  spotify_uri:"spotify:track:63T7DJ1AFDD6Bn8VzG6JE8",
)

track9 = Track.create!(
  title: "Paint It, Black",
  artist: "The Rolling Stones",
  album: "Aftermath",
  duration: 202000,
  spotify_uri:"spotify:track:37ZJ0p5Jm13JPevGcx4SkF",
)

track10 = Track.create!(
  title: "Livin' On A Prayer",
  artist: "Bon Jovi",
  album: "Slippery When Wet",
  duration: 249000,
  spotify_uri:"spotify:track:37ZJ0p5Jm13JPevGcx4SkF",
)

track11 = Track.create!(
  title: "You Shook Me All Night Long",
  artist: "AC/DC",
  album: "Back In Black",
  duration: 210000,
  spotify_uri:"spotify:track:2SiXAy7TuUkycRVbbWDEpo",
)

track12 = Track.create!(
  title: "Sweet Child O' Mine",
  artist: "Guns N' Roses",
  album: "Appetite For Destruction",
  duration: 355000,
  spotify_uri:"spotify:track:7o2CTH4ctstm8TNelqjb51",
)

track13 = Track.create!(
  title: "Crazy Train",
  artist: "Ozzy Osbourne",
  album: "Blizzard Of Ozz",
  duration: 296000,
  spotify_uri:"spotify:track:2b9lp5A6CqSzwOrBfAFhof",
)

track14 = Track.create!(
  title: "Sunday Bloody Sunday",
  artist: "U2",
  album: "War (Deluxe Edition Remastered)",
  duration: 279000,
  spotify_uri:"spotify:track:6qa36OkEeQqGaWlOcpjlGD",
)

track15 = Track.create!(
  title: "Joker And The Thief",
  artist: "Wolfmother",
  album: "Wolfmother",
  duration: 280000,
  spotify_uri:"spotify:track:6dNJ3lasVLPd0078T9yqlm",
)

track16 = Track.create!(
  title: "Hallowed Be Thy Name",
  artist: "Iron Maiden",
  album: "THe Number Of The Beast",
  duration: 431000,
  spotify_uri:"spotify:track:500h8jAdr7LvzzXlm1qxtK",
)

track17 = Track.create!(
  title: "Magic",
  artist: "Pilot",
  album: "From The Album Of The Same Name",
  duration: 186000,
  spotify_uri:"",
)

track18 = Track.create!(
  title: "Stayin' Alive",
  artist: "Bee Gees",
  album: "Greatest",
  duration: 285000,
  spotify_uri:"spotify:track:4UDmDIqJIbrW0hMBQMFOsM",
)

track19 = Track.create!(
  title: "Mr. Blue Sky",
  artist: "Electric Light Orchestra",
  album: "Out of the Blue",
  duration: 303000,
  spotify_uri:"spotify:track:2RlgNHKcydI9sayD2Df2xp",
)

track20 = Track.create!(
  title: "Uptown Girl",
  artist: "Billy Joel",
  album: "An Innocent Man",
  duration: 198000,
  spotify_uri:"spotify:track:5zA8vzDGqPl2AzZkEYQGKh",
)

track21 = Track.create!(
  title: "Dance Monkey",
  artist: "Tones and I",
  album: "Dance Monkey",
  duration: 210000,
  spotify_uri:"spotify:track:2XU0oxnq2qxCpomAAuJY8K",
)

track22 = Track.create!(
  title: "Pump It",
  artist: "Black Eyes Peas",
  album: "Monkey Business",
  duration: 213000,
  spotify_uri:"spotify:track:2ygMBIctKIAfbEBcT9065L",
)

track23 = Track.create!(
  title: "Stolen Dance",
  artist: "Milky Chance",
  album: "Sadnecessary",
  duration: 298000,
  spotify_uri:"spotify:track:2jiPHbFX5XM8TjaTfYJ0eo",
)

track24 = Track.create!(
  title: "Starboy",
  artist: "The Weeknd, Daft Punk",
  album: "Starboy",
  duration: 230000,
  spotify_uri:"spotify:track:7MXVkk9YMctZqd1Srtv4MB",
)

track25 = Track.create!(
  title: "Mirrors",
  artist: "Justin Timberlake",
  album: "The 20/20 Experience (Deluxe Edition)",
  duration: 484000,
  spotify_uri:"spotify:track:4rHZZAmHpZrA3iH5zx8frV",
)

track26 = Track.create!(
  title: "Paper Planes",
  artist: "M.I.A",
  album: "Kala",
  duration: 205000,
  spotify_uri:"spotify:track:1wgqttlPacpvmX5DKVboOa",
)

track27 = Track.create!(
  title: "Exitlude",
  artist: "The Killers",
  album: "Sam's Town",
  duration: 147000,
  spotify_uri:"spotify:track:4fCs9oQGvZGbnYXBkL4hYh",
)

track28 = Track.create!(
  title: "R U Mine?",
  artist: "Artic Monkeys",
  album: "AM",
  duration: 202000,
  spotify_uri:"spotify:track:2AT8iROs4FQueDv2c8q2KE",
)

track28 = Track.create!(
  title: "The Legend Of Zelda Main Theme Song",
  artist: "Koji Kondo",
  album: "Top 10 Nes Soundtracks",
  duration: 173000,
  spotify_uri:"spotify:track:45sBxqtVAuFpJoLGLZbYER",
)

track29 = Track.create!(
  title: "Super Mario Bros.",
  artist: "OneUp Studios",
  album: "Club Game Music",
  duration: 82000,
  spotify_uri:"spotify:track:4DG4um6R0wx4WrqhhACc5g",
)

puts "Creating playlist_tracks"
PlaylistTrack.create!(
  track: track,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track1,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track2,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track3,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track4,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track5,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track6,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track7,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track8,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track9,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track10,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track11,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track12,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track13,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track14,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track15,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track16,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track17,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track18,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track19,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track20,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track21,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track22,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track23,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track24,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track25,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track26,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track27,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track28,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track29,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track1,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track2,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track3,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track4,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track5,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track6,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track7,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track8,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track9,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track10,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track11,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track12,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track13,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track14,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track15,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track16,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track17,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track18,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track19,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track20,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track21,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track22,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track23,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track24,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track25,
  playlist: playlist2
)

PlaylistTrack.create!(
  track: track26,
  playlist: playlist3
)

PlaylistTrack.create!(
  track: track27,
  playlist: playlist
)

PlaylistTrack.create!(
  track: track28,
  playlist: playlist1
)

PlaylistTrack.create!(
  track: track29,
  playlist: playlist2
)
