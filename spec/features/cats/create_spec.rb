require 'rails_helper'

RSpec.describe 'Cats Features', type: :feature do 
    describe 'Cats create action' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')
        end
        it 'has a form page to create new cats' do
            visit cats_path
            save_and_open_page
        end
    end
end
