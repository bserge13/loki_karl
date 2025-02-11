require 'rails_helper'

RSpec.describe 'Cats Feautres', type: :feature do
    describe 'Cats update action' do 
        before :each do 
            @logan = Cat.create!(name: 'Logan', age: 2, color: 'Black')
            @karl = Cat.create!(name: 'Karl', age: 2, color: 'Brown')
        end
        it 'can update an existing cat' do 
            visit cats_path

            within "#cats-#{@logan.id}" do 
                expect(page).to have_button("Update #{@logan.name}")
                click_button("Update #{@logan.name}")
                expect(current_path).to eq(edit_cat_path(@logan.id))
            end
        end

        it 'has an update page with form fields' do 
            visit edit_cat_path(@logan.id)

            expect(page).to have_content("Update #{@logan.name}")
            expect(page).to have_field('Name')
            expect(page).to have_field('Age')
            expect(page).to have_field('Color')
            expect(page).to have_button('Update')
        end
    end
end