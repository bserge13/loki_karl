require 'rails_helper'

RSpec.describe 'Dogs Features', type: :feature do 
    describe 'Dogs destroy action' do
        before :each do 
            @ze = Dog.create!(name: 'Ze', age: 3, color: 'Black')
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @kevin = Dog.create!(name: 'Kevin', age: 2, color: 'Yellow')
        end
        it 'can delete a dog' do
            visit dogs_path 
            
            expect(page).to have_content("Create a new Cat")
            expect(page).to have_field("Name")
            expect(page).to have_field("Age")
            expect(page).to have_field("Color")
            expect(page).to have_button("Create")
        end
    end
end
