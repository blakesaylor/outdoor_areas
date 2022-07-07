require 'rails_helper'

RSpec.describe 'children index', type: :feature do
    # User Story 5, Parent Children Index 
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    it 'shows each climb and all attributes of climbs associated with an area' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        area_2 = Area.create!(name:'Boulder Canyon', state:'Colorado', rock_climbing: true, elevation: 7126, latitude: 40.002, longitude: -105.41)
        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)
        climb_2 = area_1.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)

        visit "/areas/#{area_1.id}/climbs"
        
        expect(page).to have_content(climb_1.id)
        expect(page).to have_content(climb_1.name)
        expect(page).to have_content(climb_1.lead)
        expect(page).to have_content(climb_1.sport)
        expect(page).to have_content(climb_1.trad)
        expect(page).to have_content(climb_1.top_rope)
        expect(page).to have_content(climb_1.grade)
        expect(page).to have_content(climb_1.pitches)
        expect(page).to have_content(climb_1.created_at)
        expect(page).to have_content(climb_1.updated_at)

        expect(page).to have_content(climb_2.id)
        expect(page).to have_content(climb_2.name)
        expect(page).to have_content(climb_2.lead)
        expect(page).to have_content(climb_2.sport)
        expect(page).to have_content(climb_2.trad)
        expect(page).to have_content(climb_2.top_rope)
        expect(page).to have_content(climb_2.grade)
        expect(page).to have_content(climb_2.pitches)
        expect(page).to have_content(climb_2.created_at)
        expect(page).to have_content(climb_2.updated_at)

        expect(page).to_not have_content(area_2.name)
    end
end