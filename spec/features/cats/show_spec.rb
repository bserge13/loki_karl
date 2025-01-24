require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats show page' do 
        it 'has a cats show page' do
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Grey')
            visit '/cats'

            click_link(@karl.name)
            expect(current_path).to eq("/cats/#{@karl.id}")
            expect(page).to have_content("Welcome to #{@karl.name}'s Show Page!")
        end
    end
end