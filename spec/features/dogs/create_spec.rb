require 'rails_helper'

RSpec.describe 'Dogs Features', type: :feature do 
    describe 'Dogs create action' do
        it 'has form field(s) to create new dogs' do
            visit dogs_path 

            expect(page).to have_content("Create a new Dog")
            expect(page).to have_field("Name")
            expect(page).to have_field("Age")
            expect(page).to have_field("Color")
            expect(page).to have_button("Create")
        end

        it 'creates new dogs' do
            visit dogs_path 

            expect(page).to_not have_content("Izzy")

            fill_in "Name", with: "Izzy"
            fill_in "Age", with: 5
            fill_in "Color", with: "Yellow"
            click_button "Create"

            new_dog = Dog.last
            expect(new_dog.name).to eq("Izzy")
            expect(new_dog.age).to eq(5)
            expect(new_dog.color).to eq("Yellow")
        end
    end
end