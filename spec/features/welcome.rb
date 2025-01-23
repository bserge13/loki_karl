require 'rails_helper'

RSpec.describe 'Features', type: :feature do
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
            expect(current_path).to eq('/dogs')
            expect(page).to have_content('Dogs Page!')
        end

        it 'redirects to a cat index page' do 
            click_link('Cats')
            expect(current_path).to eq('/cats')
            expect(page).to have_content('Cats Page!')
        end
    end
end