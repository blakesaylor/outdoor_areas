require 'rails_helper'

RSpec.describe 'area climbs new' do

# User Story 13, Parent Child Creation 
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
    it 'has a form to create a new climb' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)

        visit "/areas/#{area_1.id}/climbs"

        click_link 'Create Climb'

        expect(current_path).to eq("/areas/#{area_1.id}/climbs/new")

        climb_2 = area_1.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)


        fill_in 'name', with: 'Guppy'
        check 'lead'
        check 'sport'
        fill_in 'grade', with: '5.8'
        fill_in 'pitches', with: '1'

        click_on 'Create Climb'

        expect(current_path).to eq("/areas/#{area_1.id}/climbs")

        expect(page).to have_content('Guppy')
    end
end