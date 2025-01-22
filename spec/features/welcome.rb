require 'rails_helper'

RSpec.describe 'Features', type: :feature do
    describe 'Welcome page' do 
        it 'has a landing page' do 
            visit '/'
            expect(page).to have_content('Welcome!')
        end

        xit 'has links to dog and cats index pages' do
            visit '/'
            endexpect(page).to have_link('Dogs')
            endexpect(page).to have_link('Cats')
        end
    end
end