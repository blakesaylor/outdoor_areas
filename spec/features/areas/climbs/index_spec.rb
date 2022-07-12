require 'rails_helper'

RSpec.describe 'area climbs index', type: :feature do
    # User Story 5, Parent Children Index 
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    it 'shows each climb and all attributes of climbs associated with an area' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        area_2 = Area.create!(  name:'Boulder Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7126, 
                                latitude: 40.002, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                        top_rope: false,    
                                        grade: '5.8', 
                                        pitches: 4)

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade: '5.8', 
                                        pitches: 1)

        visit "/areas/#{area_1.id}/climbs"

        expect(page).to have_content(climb_1.name)
        expect(page).to have_content(climb_2.name)

        expect(page).to_not have_content(area_2.name)
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
                                        top_rope:false,    
                                        grade:'5.8', 
                                        pitches:4)

        visit "/areas/#{area_1.id}/climbs"

        expect(page).to have_link('Climbs Index')
        click_link 'Climbs Index'
        expect(current_path).to eq ('/climbs')
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
                                        top_rope:false,    
                                        grade:'5.8', 
                                        pitches:4)

        visit "/areas/#{area_1.id}/climbs"

        expect(page).to have_link('Areas Index')
        click_link 'Areas Index'
        expect(current_path).to eq ('/areas')
    end

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
    it 'has a link that takes the user to a page to create a new climb' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                        top_rope:false,    
                                        grade:'5.8', 
                                        pitches:4)

        visit "/areas/#{area_1.id}/climbs"

        expect(page).to have_link('Create Climb', href: "/areas/#{area_1.id}/climbs/new")
    end

    # User Story 16, Sort Parent's Children in Alphabetical Order by name 
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it 'has a link to sort the page in alphabetical order' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        visit "/areas/#{area_1.id}/climbs"

        expect(page).to have_link('Display in Alphabetical Order', href: "/areas/#{area_1.id}/climbs?sort=alpha")
    end
    # User Story 16, Sort Parent's Children in Alphabetical Order by name 
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    it 'can display the climbs in an area in alphabetical order' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        area_2 = Area.create!(  name:'Boulder Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7126, 
                                latitude: 40.002, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                        top_rope: false,    
                                        grade: '5.8', 
                                        pitches: 4)

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade: '5.8', 
                                        pitches: 1)

        visit "/areas/#{area_1.id}/climbs"

        #initially un-alphabetized
        within '#climb-0' do
            expect(page).to have_content(climb_1.name)
        end

        within '#climb-1' do
            expect(page).to have_content(climb_2.name)
        end

        click_link 'Display in Alphabetical Order'

        within '#climb-0' do
            expect(page).to have_content(climb_2.name)
        end

        within '#climb-1' do
            expect(page).to have_content(climb_1.name)
        end
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

        visit "areas/#{area_1.id}/climbs"

        within '#climb-0' do
            expect(page).to have_link('Edit Climb', href: "/climbs/#{climb_1.id}/edit")

            click_link 'Edit Climb'

            expect(current_path).to eq("/climbs/#{climb_1.id}/edit")
        end
    end

    # User Story 21, Display Records Over a Given Threshold 
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    it 'allows users to input a value of pitches and only show climbs with over that number of pitches' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade: '5.8', 
                                        pitches: 1)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                        top_rope: false,    
                                        grade: '5.8', 
                                        pitches: 4)

        

        visit "areas/#{area_1.id}/climbs"

        expect(page).to have_content('Guppy')
        expect(page).to have_content("Playin' Hooky")

        fill_in 'pitches', with: 2
        click_button 'Filter by Pitches'

        expect(page).to_not have_content('Guppy')
        expect(page).to have_content("Playin' Hooky")
    end
end