require 'rails_helper'

RSpec.describe 'areas index' do
    # User Story 1, Parent Index 
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    it 'returns the name of each area in system on the index page' do
        area = Area.create(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)

        visit "/areas"

        save_and_open_page

        expect(page).to have_content(area.name)
    end
end