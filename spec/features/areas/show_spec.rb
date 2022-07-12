require 'rails_helper'

RSpec.describe 'areas show by id' do
    # User Story 2, Parent Show 
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    it 'shows all of the attributes for an area when viewing /area/:id' do
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

        visit "/areas/#{area_1.id}"

        expect(page).to have_content(area_1.id)
        expect(page).to have_content(area_1.name)
        expect(page).to have_content(area_1.state)
        expect(page).to have_content(area_1.rock_climbing)
        expect(page).to have_content(area_1.elevation)
        expect(page).to have_content(area_1.latitude)
        expect(page).to have_content(area_1.longitude)
        expect(page).to have_content(area_1.created_at)
        expect(page).to have_content(area_1.updated_at)

        expect(page).to_not have_content(area_2.name)
    end

    # User Story 7, Parent Child Count
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    it 'shows a count of the climbs associated with an area' do
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
                                        grade:'5.8', 
                                        pitches:4)

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade:'5.8', 
                                        pitches:1)

        visit "areas/#{area_1.id}"

        expect(page).to have_content('Number of Climbs: ' + area_1.count_of_climbs.to_s)
        expect(area_1.count_of_climbs).to eq 2

        visit "areas/#{area_2.id}"

        expect(page).to have_content('Number of Climbs: ' + area_2.count_of_climbs.to_s)
        expect(area_2.count_of_climbs).to eq 0

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

        visit "/areas/#{area_1.id}"

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
                                        top_rope: false,    
                                        grade:'5.8', 
                                        pitches:4)

        visit "/areas/#{area_1.id}"

        expect(page).to have_link('Areas Index')
        click_link 'Areas Index'
        expect(current_path).to eq ('/areas')
    end

    # User Story 10, Parent Child Index Link
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    it 'has a link that takes the user to the list of climbs for an area' do
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

        visit "/areas/#{area_1.id}"

        expect(page).to have_link('Climbs in Area', href: "/areas/#{area_1.id}/climbs")

    end

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
    it 'has a link that takes the user to a page where they can edit climbs' do
        area_1 = Area.create!(  name:'Clear Creek Canyon', 
                                state:'Colorado', 
                                rock_climbing: true, 
                                elevation: 7400, 
                                latitude: 39.741, 
                                longitude: -105.41)

        visit "/areas/#{area_1.id}"

        expect(page).to have_link('Update Area', href: "/areas/#{area_1.id}/edit")
    end

    # User Story 19, Parent Delete 
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent
    it 'has a button that deletes the area and redirects to the areas index when clicked' do
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
        
        visit '/areas'

        # Check if area is initially in index
        expect(page).to have_content('Name: ' + area_1.name)

        # Visit area show page and click delete
        visit "/areas/#{area_1.id}"
        expect(page).to have_button('Delete Area')
        click_button 'Delete Area'

        # Check if area is no longer in index
        expect(current_path).to eq '/areas'
        expect(page).to_not have_content('Name: ' + area_1.name)
        expect(Area.where(id: area_1.id)).to eq []
        expect(Climb.where(id: climb_1.id)).to eq []
    end
end