require 'rails_helper'

RSpec.describe 'climbs show by id', type: :feature do
    # User Story 4, Child Show 
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    it 'shows all of the attributes for a climb when viewing /climb/:id' do
        area_1 = Area.create!(name:'Clear Creek Canyon', state:'Colorado', rock_climbing: true, elevation: 7400, latitude: 39.741, longitude: -105.41)
        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:4)
        climb_2 = area_1.climbs.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, grade:'5.8', pitches:1)

        visit "/climbs/#{climb_1.id}"

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

        expect(page).to_not have_content(climb_2.name)
    end
end