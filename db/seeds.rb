# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Climb.destroy_all
Area.destroy_all

clear_creek = Area.create!( name:'Clear Creek Canyon', 
                            state:'Colorado', 
                            rock_climbing: true, 
                            elevation: 7400, 
                            latitude: 39.741, 
                            longitude: -105.41)

boulder_canyon = Area.create!(  name:'Boulder Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7126, 
                                latitude: 40.002, 
                                longitude: -105.41)

wichita_mountains = Area.create!(   name:'Wichita Mountains', 
                                    state:'Oklahoma', 
                                    rock_climbing: true, 
                                    elevation: 1488, 
                                    latitude: 34.711, 
                                    longitude: -98.623)

playin_hooky = clear_creek.climbs.create!(  name: "Playin' Hooky", 
                                            top_rope: false, 
                                            grade: '5.8', 
                                            pitches: 4)

guppy = clear_creek.climbs.create!(         name: "Guppy", 
                                            top_rope: true, 
                                            grade: '5.8', 
                                            pitches: 1)

curvaceous = clear_creek.climbs.create!(    name: "Curvaceous", 
                                            top_rope: false, 
                                            grade: '5.11b', 
                                            pitches: 1)

walking_with_a_ghost = clear_creek.climbs.create!(  name: "Walking With A Ghost", 
                                                    top_rope: true, 
                                                    grade: '5.11b', 
                                                    pitches: 1)

solid_gold = clear_creek.climbs.create!(    name: "Solid Gold", 
                                            top_rope: false, 
                                            grade: '5.12a', 
                                            pitches: 5)

cosmosis = boulder_canyon.climbs.create!(   name: "Cosmosis", 
                                            top_rope: false, 
                                            grade: '5.10a', 
                                            pitches: 2)

aardvark = boulder_canyon.climbs.create!(   name: "Aardvark", 
                                            top_rope: true, 
                                            grade: '5.9-', 
                                            pitches: 1)

baby_dog = boulder_canyon.climbs.create!(   name: "Buried Treasure", 
                                            top_rope: false, 
                                            grade: '5.9-', 
                                            pitches: 2)

the_memory_of_trees = boulder_canyon.climbs.create!(name: "The Memory of Trees", 
                                                    top_rope: true, 
                                                    grade: '5.9', 
                                                    pitches: 1)

tower_of_power = boulder_canyon.climbs.create!( name: "Tower of Power", 
                                                top_rope: true, 
                                                grade:'5.10b', 
                                                pitches: 1)

great_expectations = wichita_mountains.climbs.create!(  name: "Great Expectations", 
                                                        top_rope: false, 
                                                        grade:'5.5', 
                                                        pitches: 1)

come_and_get_your_love = wichita_mountains.climbs.create!( 
    name: "Come and Get Your Love", 
    top_rope: true, 
    grade:'5.10a', 
    pitches: 1)