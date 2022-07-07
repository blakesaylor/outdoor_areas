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
end