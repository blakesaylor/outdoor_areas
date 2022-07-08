require 'rails_helper'

RSpec.describe 'create new area' do
    # User Story 11, Parent Creation 
    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent 
    it 'has a form to create a new area' do
        visit '/areas'

        click_link 'New Area'

        expect(current_path).to eq('/areas/new')

        fill_in 'name', with: 'Wichita Wildlife Refuge'
        fill_in 'state', with: 'Oklahoma'
        check 'rock_climbing'
        fill_in 'elevation', with: 1488
        fill_in 'latitude', with: 34.711
        fill_in 'longitude', with: -98.623
        click_on 'Create Area'

        expect(current_path).to eq("/areas")
        expect(page).to have_content('Wichita Wildlife Refuge')
    end
end