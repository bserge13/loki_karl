require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats index page' do 
        it 'has an index page of cats and their attrs' do
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            visit '/cats'

            within "#cats-#{@karl.id}" do
                expect(page).to have_content("Name: #{@karl.name}")
                expect(page).to have_content("Age: #{@karl.age}")
                expect(page).to have_content("Coat: #{@karl.color}")
            end

            expect(page).to have_link(@cowboy.name)
            click_link(@cowboy.name)
            expect(current_path).to eq("/cats/#{@cowboy.id}")
        end
    end
end