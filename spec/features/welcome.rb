require 'rails_helper'

RSpec.describe 'Landing Page', type: :feature do
    describe 'Welcome page' do 
        before :each do
            visit '/'
        end

        it 'has a landing page' do 
            expect(page).to have_content('Welcome!')
        end

        it 'has links to dog and cats index pages' do
            expect(page).to have_link('Dogs')
            expect(page).to have_link('Cats')
        end

        it 'redirects to a dog index page' do 
            click_link('Dogs')
            expect(current_path).to eq(dogs_path)
            expect(page).to have_content('Dogs Page!')
        end

        it 'redirects to a cat index page' do 
            click_link('Cats')
            expect(current_path).to eq(cats_path)
            expect(page).to have_content('Cats Page!')
        end

        it 'has link and redirects to page for creating families' do 
            expect(page).to have_link('Create a Pet Family')
            click_link('Create a Pet Family')
        end
    end
end