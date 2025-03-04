require 'rails_helper'

RSpec.describe 'Families Features', type: :feature do 
    describe 'Families page' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @nova = Dog.create!(name: 'Nova', age: 8, color: 'Yellow')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')

            Family.create!(dog_id: @loki.id, cat_id: @karl.id)
            Family.create!(dog_id: @nova.id, cat_id: @karl.id)
            Family.create!(dog_id: @heidi.id, cat_id: @karl.id)

            Family.create!(dog_id: @loki.id, cat_id: @karl.id)
            Family.create!(dog_id: @loki.id, cat_id: @cowboy.id)
            Family.create!(dog_id: @loki.id, cat_id: @bexley.id)
        end

        it 'has an index of a cats associated dogs' do
            visit cat_path(@karl.id)
            click_link("#{@karl.name}'s Dogs")

            expect(page).to have_content("#{@karl.name}'s Family")
            expect(page).to have_link(@loki.name)
            expect(page).to have_link(@nova.name)
            expect(page).to have_link(@heidi.name)
        end

        it 'has an index of a dogs associated cats' do
            visit dog_path(@loki.id)
            click_link("#{@loki.name}'s Cats")

            expect(page).to have_content("#{@loki.name}'s Family")
            expect(page).to have_link(@karl.name)
            expect(page).to have_link(@cowboy.name)
            expect(page).to have_link(@bexley.name)
        end

        it 'reroutes to an animals show page- cat-to-dog' do 
            visit families_cats_path(@karl.id)
            click_link(@nova.name)

            expect(current_path).to eq("/dogs/#{@nova.id}")
        end

        it 'reroutes to an animals show page- dog-to-cat' do 
            visit families_dogs_path(@loki.id)
            click_link(@bexley.name)

            expect(current_path).to eq("/cats/#{@bexley.id}")
        end

        it 'has an index page of all associations' do 
            
        end
    end
end