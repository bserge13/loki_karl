require 'rails_helper'

RSpec.describe 'Families Features', type: :feature do 
    describe 'Families page' do
        before :each do 
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')

            @lc = Family.create!(dog_id: @loki.id, cat_id: @cowboy.id)
            @hb = Family.create!(dog_id: @heidi.id, cat_id: @bexley.id)
        end

        it 'has a show page to redirect to' do 
            visit all_families_path

            expect(page).to have_link("#{@loki.name} and #{@cowboy.name}")
            expect(page).to have_link("#{@heidi.name} and #{@bexley.name}")
        end

        it 'redirects to a family show page' do 
            visit all_families_path
            click_link("#{@loki.name} and #{@cowboy.name}")

            expect(current_path).to eq(family_path(@lc.id))
        end

        it 'has a show page with association info' do 
            visit(family_path(@lc.id))

            expect(page).to have_content("#{@loki.name} and #{@cowboy.name} Show Page")
            
            expect(page).to have_content(@loki.name)
            expect(page).to have_content(@loki.age)
            expect(page).to have_content(@loki.color)
            
            expect(page).to have_content(@cowboy.name)
            expect(page).to have_content(@cowboy.age)
            expect(page).to have_content(@cowboy.color)

            # add partial to view pages for redirecting back to pages
        end
    end 
end 