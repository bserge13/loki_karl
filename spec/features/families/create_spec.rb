require 'rails_helper'

RSpec.describe 'Create Families', type: :feature do
    describe 'New Familiy Associations' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 2, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 2, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 2, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @nova = Dog.create!(name: 'Nova', age: 10, color: 'Yellow')
            @heidi = Dog.create!(name: 'Heidi', age: 13, color: 'White')
        end

        it 'has a form field to create new associations' do 
            visit new_families_path

            expect(page).to have_content('Create a new Pet Association')
            
            # Add form field to new page to input a cat id and dog id and create association

            # Add all exisiting pets to page, showcasing their name and id's
            # Form fields will be "input the pets ID's into the form fields"
            
            # Maybe go wtih model methods to filter pets already associated?
            # Or just showcase existing pet associations?
        end
    end 
end 