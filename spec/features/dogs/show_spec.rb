require 'rails_helper'

RSpec.describe 'Dogs Features', type: :feature do 
    describe 'Dogs show page' do 
        before :each do 
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
        end

        it 'has a dogs show page' do
            visit dogs_path

            click_link(@loki.name)
            expect(current_path).to eq("/dogs/#{@loki.id}")
            expect(page).to have_content("Welcome to #{@loki.name}'s Show Page!")
        end

        it 'has a link to see cats associated with a dog' do
            visit dog_path(@loki.id)

            expect(page).to have_content('See our other four-legged sibblings')
            expect(page).to have_link("#{@loki.name}'s Cats")
            
            click_link("#{@loki.name}'s Cats")
            expect(current_path).to eq("/families/dogs/#{@loki.id}")
        end
    end
end