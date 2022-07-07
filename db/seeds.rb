# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Climb.destroy_all
Area.destroy_all

clear_creek = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
boulder_canyon = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)
playin_hooky = clear_creek.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)
guppy = clear_creek.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)