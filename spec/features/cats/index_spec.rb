require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats index page' do 
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 2, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 5, color: 'Brown')
            
            visit cats_path
        end
        it 'has an index page of cats and their attrs' do
            within "#cats-#{@karl.id}" do
                expect(page).to have_content("Name: #{@karl.name}")
                expect(page).to have_content("Age: #{@karl.age}")
                expect(page).to have_content("Coat: #{@karl.color}")
            end

            expect(page).to have_link(@cowboy.name)
            click_link(@cowboy.name)
            expect(current_path).to eq("/cats/#{@cowboy.id}")
        end

        it 'lists the average age of all the cats listed' do
            expect(page).to have_content("Average age")
            expect(page).to have_content(Cat.average_cat_age)
            expect(Cat.average_cat_age).to eq(2.67)
        end
    end
end