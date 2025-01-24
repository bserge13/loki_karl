require 'rails_helper'

RSpec.describe 'Cats Features'm type: :feature do 
    describe 'Cats page' do 
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Grey')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')
        end
        it 'has an index page with cats' do
            visit '/cats'
            within "#cats-#{@karl.id}" do
                expect(page).to have_content(@karl.name)
                expect(page).to have_content(@karl.age)
                expect(page).to have_content(@karl.color)
            end
        end
    end
end