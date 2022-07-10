require 'rails_helper'

RSpec.describe 'climbs index', type: :feature do
    # User Story 3, Child Index 
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    it 'shows the name of each climb in system on the index page' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        # climb_1 = area_1.climbs.create!(name: "Playin' Hooky", 
        #                                 top_rope: false, 
        #                                 grade:'5.8', 
        #                                 pitches:4)

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade:'5.8', 
                                        pitches:1)

        visit '/climbs'

        # expect(page).to have_content(climb_1.name)
        expect(page).to have_content(climb_2.name)
    end

    # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    it 'has a link that takes the user to the climbs index' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", 
                                        top_rope: false, 
                                        grade:'5.8', 
                                        pitches:4)

        visit '/climbs'

        expect(page).to have_link('Climbs Index', href: '/climbs')
    end

    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    it 'has a link that takes the user to the areas index' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", 
                                        top_rope: false, 
                                        grade:'5.8', 
                                        pitches:4)

        visit '/climbs'

        expect(page).to have_link('Areas Index', href: '/areas')
    end

    # User Story 15, Child Index only shows `true` Records 
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    it 'only shows climbs that are top ropeable' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky", 
                                        top_rope: false, 
                                        grade:'5.8', 
                                        pitches:4)

        climb_2 = area_1.climbs.create!(name: "Staff", 
                                        top_rope: true, 
                                        grade:'5.9', 
                                        pitches:1)

        visit '/climbs'

        expect(page).to_not have_content(climb_1.name)
        expect(page).to have_content(climb_2.name)
    end

    # User Story 18, Child Update From Childs Index Page 
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    it 'has links to edit climb information' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Staff", 
                                        top_rope: true, 
                                        grade:'5.9', 
                                        pitches:1)

        visit '/climbs'

        within '#climb-0' do
            expect(page).to have_link('Edit Climb', href: "/climbs/#{climb_1.id}/edit")

            click_link 'Edit Climb'

            expect(current_path).to eq("/climbs/#{climb_1.id}/edit")
        end
    end
end