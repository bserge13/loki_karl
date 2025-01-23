require 'rails_helper'

RSpec.describe 'Features', type: :feature do
    describe 'Welcome page' do 
        it 'has a landing page' do 
            visit '/'
            expect(page).to have_content('Welcome!')
        end

        it 'has links to dog and cats index pages' do
            visit '/'
            expect(page).to have_link('Dogs')
            expect(page).to have_link('Cats')
        end

        it 'redirects to a dog or cat index page' do 
            visit '/'
            click_link('Dogs')
            expect(current_path).to eq('/dogs')
        end
    end
end