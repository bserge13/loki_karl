require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats show page' do 
        it 'has a cats show page' do
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            visit cats_path

            click_link(@karl.name)
            expect(current_path).to eq("/cats/#{@karl.id}")
            expect(page).to have_content("Welcome to #{@karl.name}'s Show Page!")
            
            expect(page).to have_link('To Home')
            click_link('To Home')
            expect(current_path).to eq(home_path)
        end

        it 'has a link to see dogs associated with a cat' do
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Grey')
            visit cat_path(@karl.id)

            expect(page).to have_content('See our other four-legged sibblings')
            expect(page).to have_link("#{@karl.name}'s Dogs")
            
            click_link("#{@karl.name}'s Dogs")
            expect(current_path).to eq("/families/cats/#{@karl.id}")
        end
    end
end