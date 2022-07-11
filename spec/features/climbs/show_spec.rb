require 'rails_helper'

RSpec.describe 'climbs show by id', type: :feature do
    # User Story 4, Child Show 
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    it 'shows all of the attributes for a climb when viewing /climb/:id' do
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

        climb_2 = area_1.climbs.create!(name: "Guppy", 
                                        top_rope: true, 
                                        grade:'5.8', 
                                        pitches:1)

        visit "/climbs/#{climb_1.id}"

        expect(page).to have_content(climb_1.id)
        expect(page).to have_content(climb_1.name)
        expect(page).to have_content(climb_1.top_rope)
        expect(page).to have_content(climb_1.grade)
        expect(page).to have_content(climb_1.pitches)
        expect(page).to have_content(climb_1.created_at)
        expect(page).to have_content(climb_1.updated_at)

        expect(page).to_not have_content(climb_2.name)
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

        visit "/climbs/#{climb_1.id}"

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

        visit "/climbs/#{climb_1.id}"

        expect(page).to have_link('Areas Index')
        click_link 'Areas Index'
        expect(current_path).to eq ('/areas')
    end

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
    it 'has a link to update the climb' do
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

        visit "climbs/#{climb_1.id}"

        expect(page).to have_link('Update Climb', href: "/climbs/#{climb_1.id}/edit")
    end

    # User Story 20, Child Delete 
    # As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child
    it 'has a button that deletes the climb and redirects to the climbs index when clicked' do
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

        visit "/climbs/"
        
        # Climb won't show up if top_rope isn't true
        expect(page).to_not have_content(climb_1.name)

        # Climb will show up if top_rope is true
        expect(page).to have_content(climb_2.name)

        visit "/climbs/#{climb_2.id}"
        
        expect(page).to have_button('Delete Climb')

        click_button 'Delete Climb'

        expect(current_path).to eq '/climbs/'

        expect(page).to_not have_content(climb_1.name)
        expect(page).to_not have_content(climb_2.name)
    end
end