require 'rails_helper'

RSpec.describe Area, type: :model do
    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :state }
        it { should allow_value(true).for(:rock_climbing)}
        it { should allow_value(false).for(:rock_climbing)}
        it { should validate_presence_of :elevation }
        it { should validate_presence_of :latitude }
        it { should validate_presence_of :longitude }
    end

    describe 'relationships' do
        it {should have_many :climbs }
    end

    describe 'methods' do
        describe 'sort_by_created_datetime' do
            it 'orders areas by created_at (most recent first)' do
                area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
                area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)

                areas = Area.all

                expect(areas).to eq [area_1, area_2]
                expect(areas.sort_by_created_datetime).to eq [area_2, area_1]
            end
        end

        describe 'count_of_climbs' do
            it 'returns a count of climbs in an area' do
                area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
                area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)
                climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)
                climb_2 = area_1.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)

                expect(area_1.count_of_climbs).to eq 2
                expect(area_2.count_of_climbs).to eq 0
            end
        end
    end
end