require 'rails_helper'

RSpec.describe 'Edit Area' do
    # User Story 12, Parent Update 
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    it 'I can update an area' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)

        visit "/areas/#{area_1.id}"

        click_link 'Update Area'

        expect(current_path).to eq("/areas/#{area_1.id}/edit")

        fill_in 'name', with: 'Clear Creek'
        fill_in 'state', with: 'Colorado'
        check 'rock_climbing'
        fill_in 'elevation', with: 7400
        fill_in 'latitude', with: 39.741
        fill_in 'longitude', with: -105.41
        click_on 'Update Area'

        expect(current_path).to eq("/areas/#{area_1.id}")
        expect(page).to have_content('Clear Creek')
    end

        # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    it 'has a link that takes the user to the climbs index' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)

        visit "/areas/#{area_1.id}/edit"
        
        expect(page).to have_link('Climbs Index', href: '/climbs')
    end

    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    it 'has a link that takes the user to the areas index' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        
        visit "/areas/#{area_1.id}/edit"
        
        expect(page).to have_link('Areas Index', href: '/areas')
    end
end