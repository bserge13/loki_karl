require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats create action' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            visit cats_path
        end
        it 'has form field(s) to create new cats' do
            expect(page).to have_field("Name")
            expect(page).to have_field("Age")
            expect(page).to have_field("Color")
            expect(page).to have_button("Create")
        end

        it 'creates new cats' do
            expect(page).to_not have_content("Greyling")

            fill_in "Name", with: "Greyling"
            fill_in "Age", with: 8
            fill_in "Color", with: "Grey"
            click_button "Create"

            expect(current_path).to eq(cats_path)
            expect(page).to have_content("Greyling")
        end
    end
end
