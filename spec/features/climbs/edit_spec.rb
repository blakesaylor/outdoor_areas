require 'rails_helper'

RSpec.describe 'climbs edit', type: :feature do
    # User Story 14, Child Update 
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
    it 'can update a climb' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)

        visit "/climbs/#{climb_1.id}"

        click_link 'Update Climb'

        expect(current_path).to eq("/climbs/#{climb_1.id}/edit")

        fill_in 'name', with: 'Playing Hooky'
        click_on 'Update Climb'

        expect(current_path).to eq("/climbs/#{climb_1.id}")
        expect(page).to have_content('Playing Hooky')
    end
end