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
            
            expect(page).to have_content(@kevin.name )
            expect(page).to have_button("Delete #{@kevin.name}")

            click_button("Delete #{@kevin.name}")
            expect(current_path).to eq(dog_path(@kevin.id))

            expect(page).to_not have_content(@kevin.name)
        end
    end
end
