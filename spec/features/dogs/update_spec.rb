require 'rails_helper'

RSpec.describe 'Dogs Feautres', type: :feature do
    describe 'Dogs update action' do 
        before :each do 
            @ze = Dog.create!(name: 'Ze', age: 3, color: 'Black')
        end
        it 'can update an existing cat' do 
            visit dogs_path

            expect(page).to have_button("Update #{@ze.name}")
            click_button("Update #{@ze.name}")
            expect(current_path).to eq(edit_cat_path(@ze.id))
        end

        it 'has an update page with form fields' do 
            visit edit_dog_path(@ze.id)

            expect(page).to have_content("Update #{@ze.name}")
            expect(page).to have_field('Name')
            expect(page).to have_field('Age')
            expect(page).to have_field('Color')
            expect(page).to have_button('Update')
        end

        it 'can update an existing cats attrs' do 
            visit dogs_path

            expect(page).to have_content("Age: 3")
            click_button("Update #{@ze.name}")

            fill_in "Age", with: 7
            click_button("Update")
            expect(current_path).to eq(dogs_path)

            expect(page).to have_content("Age: 7")
        end
    end
end