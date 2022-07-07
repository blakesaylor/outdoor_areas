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
        describe 'sort_by_created_at' do
            it 'orders restaurants by created_at (most recent first)' do
                area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
                area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)

                areas = Area.all

                expect(areas).to eq [area_1, area_2]
                expect(areas.sort_by_created_datetime).to eq [area_2, area_1]
            end
        end
    end
end