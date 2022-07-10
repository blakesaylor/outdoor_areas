require 'rails_helper'

RSpec.describe Climb, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should allow_value(true).for(:top_rope)}
        it { should allow_value(false).for(:top_rope)}
        it { should validate_presence_of :grade }
        it { should validate_presence_of :pitches }
    end

    describe 'relationships' do
        it {should belong_to :area }
    end

    describe 'methods' do
        describe 'show_top_ropeable' do
            it 'returns an array of climbs in an area that are top ropeable' do
                area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                        state:'Colorado', 
                                        rock_climbing: true, 
                                        elevation: 7400, 
                                        latitude: 39.741, 
                                        longitude: -105.41)

                area_2 = Area.create!(  name:'Boulder Canyon', 
                                        state:'Colorado', 
                                        rock_climbing: true, 
                                        elevation: 7126,
                                        latitude: 40.002, 
                                        longitude: -105.41)

                climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                                top_rope:false, 
                                                grade:'5.8', 
                                                pitches:4)

                climb_2 = area_1.climbs.create!(name: "Guppy", 
                                                top_rope: true, 
                                                grade:'5.8', 
                                                pitches:1)

                expect(area_1.climbs.show_top_ropeable.count).to eq 1
                expect(area_1.climbs.show_top_ropeable).to eq [climb_2]
            end
        end

        describe 'alphabetical' do
            it 'returns an array of climbs in alphabetical order' do
                area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                        state:'Colorado', 
                                        rock_climbing: true, 
                                        elevation: 7400, 
                                        latitude: 39.741, 
                                        longitude: -105.41)

                area_2 = Area.create!(  name:'Boulder Canyon', 
                                        state:'Colorado', 
                                        rock_climbing: true, 
                                        elevation: 7126,
                                        latitude: 40.002, 
                                        longitude: -105.41)

                climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                                top_rope:false, 
                                                grade:'5.8', 
                                                pitches:4)

                climb_2 = area_1.climbs.create!(name: "Guppy", 
                                                top_rope: true, 
                                                grade:'5.8', 
                                                pitches:1)

                #unalphabetized
                expect(area_1.climbs).to eq [climb_1, climb_2]

                #alphabetized
                expect(area_1.climbs.alphabetical).to eq [climb_2, climb_1]
            end
        end
    end
end