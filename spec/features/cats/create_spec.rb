require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats create action' do
        it 'has form field(s) to create new cats' do
            visit cats_path 
            
            expect(page).to have_content("Create a new Cat")
            expect(page).to have_field("Name")
            expect(page).to have_field("Age")
            expect(page).to have_field("Color")
            expect(page).to have_button("Create")
        end

        it 'creates new cats' do
            visit cats_path 

            expect(page).to_not have_content("Greyling")

            fill_in "Name", with: "Greyling"
            fill_in "Age", with: 8
            fill_in "Color", with: "Grey"
            click_button "Create"

            new_cat = Cat.last

            expect(new_cat.name).to eq("Greyling")
            expect(new_cat.age).to eq(8)
            expect(new_cat.color).to eq("Grey")
        end
    end
end
