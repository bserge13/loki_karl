require 'rails_helper'

RSpec.describe 'Create Families', type: :feature do
    describe 'New Familiy Associations' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 2, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 2, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 2, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @nova = Dog.create!(name: 'Nova', age: 10, color: 'Yellow')
            @heidi = Dog.create!(name: 'Heidi', age: 13, color: 'White')
        end

        it 'has a form field to create new associations' do 
            visit new_families_path

            expect(page).to have_content('Create a new Pet Association')

            expect(page).to have_content(@loki.name)
            expect(page).to have_content(@loki.id)
            
            expect(page).to have_content(@nova.name)
            expect(page).to have_content(@nova.id)

            expect(page).to have_content(@heidi.name)
            expect(page).to have_content(@heidi.id)

            expect(page).to have_content(@karl.name)
            expect(page).to have_content(@karl.id)
            
            expect(page).to have_content(@cowboy.name)
            expect(page).to have_content(@cowboy.id)

            expect(page).to have_content(@bexley.name)
            expect(page).to have_content(@bexley.id)

            expect(page).to have_field("Dog ID")
            expect(page).to have_field("Cat ID")
            expect(page).to have_button("Create")
            
            # Maybe go wtih model methods to filter pets already associated?
            # Or just showcase existing pet associations?
        end

        it 'creates new family associations' do 
            visit new_families_path

            fill_in "Cat ID", with: "#{@bexley.id}"
            fill_in "Dog ID", with: "#{@loki.id}"
            click_button "Create"
            expect(current_path).to eq(all_families_path)

            new_family = Family.last

            expect(new_family.cat_id).to eq(@bexley.id)
            expect(new_family.dog_id).to eq(@loki.id)
        end
    end 
end 