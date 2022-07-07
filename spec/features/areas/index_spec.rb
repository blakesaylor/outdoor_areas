require 'rails_helper'

RSpec.describe 'areas index', type: :feature do
    # User Story 1, Parent Index 
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    it 'shows the name of each area in system on the index page' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)

        visit '/areas/'

        expect(page).to have_content(area_1.name)
        expect(page).to have_content(area_2.name)
    end
end