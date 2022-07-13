require 'rails_helper'

RSpec.describe 'areas index', type: :feature do
    # User Story 1, Parent Index 
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    it 'shows the name of each area in system on the index page' do
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

        visit '/areas/'

        expect(page).to have_content(area_1.name)
        expect(page).to have_content(area_2.name)
    end

    # User Story 6, Parent Index sorted by Most Recently Created 
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    it 'shows all areas ordered by the created_at column' do
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

        visit '/areas/'

        within '#area-0' do
            expect(page).to have_content(area_2.name)
        end

        within '#area-1' do
            expect(page).to have_content(area_1.name)
        end
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

        visit '/areas/'

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

        visit '/areas/'

        expect(page).to have_link('Areas Index')
        click_link 'Areas Index'
        expect(current_path).to eq ('/areas')
    end

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
    # and I am redirected to the Parent Index page where I see the new Parent displayed.
    it 'has a link that takes a user to a page to add a new area' do
        visit '/areas/'

        expect(page).to have_link('New Area', href: '/areas/new')
    end

    # User Story 17, Parent Update From Parent Index Page 
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
    it 'has a button to edit the attributes for an area' do
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
        
        visit '/areas'

        within '#area-0' do
            expect(page).to have_link('Edit Area', href: "/areas/#{area_2.id}/edit")
        end

        within '#area-1' do
            expect(page).to have_link('Edit Area', href: "/areas/#{area_1.id}/edit")
        end
    end

    it 'takes the user to the edit page when the edit button is pressed' do
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
        
        visit '/areas'

        within '#area-0' do
            expect(page).to have_link('Edit Area')
            click_link 'Edit Area'
            expect(current_path).to eq "/areas/#{area_2.id}/edit"
        end
    end

    # User Story 22, Parent Delete From Parent Index Page 
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
    it 'has a button to delete an area and all children' do
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

        visit '/areas'

        within '#area-0' do
            expect(page).to have_link('Delete Area')
        end
    end

    it 'deletes the area and all children when the delete button is pushed' do
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

        area_2 = Area.create!(  name:'Boulder Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7126, 
                                latitude: 40.002, 
                                longitude: -105.41)

        visit '/areas'

        within '#area-0' do
            expect(page).to have_link('Delete Area')
            click_link 'Delete Area'
        end

        expect(current_path).to eq('/areas')

        within '#area-0' do
            expect(page).to have_content('Name: ' + area_1.name)
        end
    end

    # Additional Functionality
    it 'has a button to go to the show page for climbs' do
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

        visit '/areas'

        within '#area-0' do
            expect(page).to have_link('View Area')
            click_link 'View Area'
        end

        expect(current_path).to eq("/areas/#{area_1.id}")
    end

    # Extension 1:
    # Search by name (exact match)
    # As a visitor
    # When I visit an index page ('/parents') or ('/child_table_name')
    # Then I see a text box to filter results by keyword
    # When I type in a keyword that is an exact match of one or more of my records and press the Search button
    # Then I only see records that are an exact match returned on the page
    it 'has a text box to filter results by exact name' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        climb_1 = area_1.climbs.create!(name: "Playin' Hooky",
                                        top_rope:true,    
                                        grade:'5.8', 
                                        pitches:4)

        visit '/areas'

        expect(page).to have_button('Search by Name')
    end

    it 'filters areas by exact name search' do
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

        area_2 = Area.create!(  name:'Boulder Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7126, 
                                latitude: 40.002, 
                                longitude: -105.41)

        visit '/areas'

        expect(page).to have_content("Clear Creek Canyon")
        expect(page).to have_content("Boulder Canyon")

        fill_in 'exact', with: 'Boulder Canyon'
        click_on 'Search'

        expect(page).to_not have_content("Clear Creek Canyon")
        expect(page).to have_content("Boulder Canyon")
    end
end