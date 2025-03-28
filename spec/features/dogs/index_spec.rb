require 'rails_helper'

RSpec.describe 'Dogs Features', type: :feature do 
    describe 'Dogs index page' do 
        before :each do
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @nova = Dog.create!(name: 'Nova', age: 8, color: 'Yellow')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')
            
            visit dogs_path
        end 
        
        it 'has an index page of dogs and their attrs' do
            within "#dogs-#{@loki.id}" do
                expect(page).to have_content("Name: #{@loki.name}")
                expect(page).to have_content("Age: #{@loki.age}")
                expect(page).to have_content("Coat: #{@loki.color}")
            end

            expect(page).to have_link(@nova.name)
            click_link(@nova.name)
            expect(current_path).to eq("/dogs/#{@nova.id}")
        end

        it 'lists the average age of all the dogs listed' do
            expect(page).to have_content("Average age")
            expect(page).to have_content(Dog.average_dog_age)
            expect(Dog.average_dog_age).to eq(7.67)
        end

        it 'has a link to reroute back to landing page' do 
            expect(page).to have_link('To Home')
            click_link('To Home')
            expect(current_path).to eq(home_path)
        end
    end
end