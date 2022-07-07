require 'rails_helper'

RSpec.describe 'areas show by id' do
    # User Story 2, Parent Show 
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    it 'shows all of the attributes for an area when viewing /area/:id' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)

        visit "/areas/#{area_1.id}"

        expect(page).to have_content(area_1.id)
        expect(page).to have_content(area_1.name)
        expect(page).to have_content(area_1.state)
        expect(page).to have_content(area_1.rock_climbing)
        expect(page).to have_content(area_1.elevation)
        expect(page).to have_content(area_1.latitude)
        expect(page).to have_content(area_1.longitude)
        expect(page).to have_content(area_1.created_at)
        expect(page).to have_content(area_1.updated_at)

        expect(page).to_not have_content(area_2.name)
    end

    # User Story 7, Parent Child Count
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    it 'shows a count of the climbs associated with an area' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)
        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)
        climb_2 = area_1.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)

        visit "areas/#{area_1.id}"

        expect(area_1.count_of_climbs).to eq 2

        visit "areas/#{area_2.id}"

        expect(area_2.count_of_climbs).to eq 0

    end
end