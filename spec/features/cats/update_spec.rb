require 'rails_helper'

RSpec.describe 'Cats Feautres', type: :feature do
    describe 'Cats update action' do 
        before :each do 
            @logan = Cat.create!(name: 'Logan', age: 3, color: 'Black')
        end
        it 'can update an existing cat' do 
            visit cats_path

            expect(page).to have_button("Update #{@logan.name}")
            click_button("Update #{@logan.name}")
            expect(current_path).to eq(edit_cat_path(@logan.id))
        end

        it 'has an update page with form fields' do 
            visit edit_cat_path(@logan.id)

            expect(page).to have_content("Update #{@logan.name}")
            expect(page).to have_field('Name')
            expect(page).to have_field('Age')
            expect(page).to have_field('Color')
            expect(page).to have_button('Update')
        end

        it 'can update an existing cats attrs' do 
            visit cats_path

            expect(page).to have_content("Age: 3")
            click_button("Update #{@logan.name}")

            fill_in "Age", with: 2
            click_button("Update")
            expect(current_path).to eq(cats_path)

            expect(page).to have_content("Age: 2")
        end
    end
end