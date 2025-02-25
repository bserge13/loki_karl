require 'rails_helper'

RSpec.describe 'Create Families', type: :feature do
    describe 'New Familiy Associations' do 
        it 'has a form field to create new associations' do 
            visit new_families_path

            expect(page).to have_content('Create a new Pet Association')
            
            # Add form field to new page
            # Add all exisiting pets, broken down by category of animal to be able to choose from 
            # Form fields will be "input the pets ID's into the form fields"
        end
    end 
end 