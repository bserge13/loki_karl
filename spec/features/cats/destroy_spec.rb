require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats destroy action' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 2, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @chester = Cat.create!(name: 'Chester', age: 5, color: 'Orange')
        end
        
        it 'can delete a cat' do
            visit cats_path 
            
            expect(page).to have_content(@chester.name )
            expect(page).to have_button("Delete #{@chester.name}")

            click_button("Delete #{@chester.name}")
            expect(current_path).to eq(cat_path(@chester.id))

            expect(page).to_not have_content(@chester.name)
            expect(page).to have_content(@karl.name)
            expect(page).to have_content(@cowboy.name)
        end
    end
end
