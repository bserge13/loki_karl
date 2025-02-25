require 'rails_helper'

RSpec.describe 'Create Families', type: :feature do
    describe 'New Familiy Associations' do 
        it 'has a form field to create new associations' do 
            visit new_families_path

            expect(page).to have_content('Create a new Pet Association')
        end
    end 
end 