require 'rails_helper'

RSpec.describe 'Dogs Features', type: :feature do 
    describe 'Dogs index page' do 
        it 'has an index page of dogs and their attrs' do
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @nova = Dog.create!(name: 'Nova', age: 8, color: 'Yellow')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')

            visit '/dogs'

            within "#dogs-#{@loki.id}" do
                expect(page).to have_content("Name: #{@loki.name}")
                expect(page).to have_content("Age: #{@loki.age}")
                expect(page).to have_content("Coat: #{@loki.color}")
            end

            expect(page).to have_link(@nova.name)
            click_link(@nova.name)
            expect(current_path).to eq("/dogs/#{@nova.id}")
        end
    end
end