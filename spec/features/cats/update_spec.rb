require 'rails_helper'

RSpec.describe 'Cats Feautres', type: :feature do
    describe 'Cats update action' do 
        it 'can update an existing cat' do 
            @logan = Cat.create!(name: 'Logan', age: 2, color: 'Black')

            visit cats_path

            within "#cats-#{@logan.id}" do 
                expect(page).to have_button('Update')
                click_button('Update')
                expect(current_path).to eq(edit_cat_path(@logan.id))
            end
        end
    end
end