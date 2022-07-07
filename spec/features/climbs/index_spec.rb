require 'rails_helper'

RSpec.describe 'climbs index', type: :feature do
    # User Story 3, Child Index 
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'shows the name of each climb in system on the index page' do
        climb_1 = Climb.create!(name: "Playin' Hooky", lead:true, sport:true, trad:false, top_rope:false, class:5, grade:8, pitches:4)
        climb_2 = Climb.create!(name: "Guppy", lead:true, sport:true, trad:false, top_rope:false, class:5, grade:8, pitches:1)

        visit '/climbs'

        expect(page).to have_content(climb_1.name)
        expect(page).to have_content(climb_2.name)
    end
end