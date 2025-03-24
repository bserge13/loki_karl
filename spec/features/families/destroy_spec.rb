require 'rails_helper'

RSpec.describe 'Families Features' do
    describe 'Families Destroy Feature' do 
        before :each do 
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')

            @lc = Family.create!(dog_id: @loki.id, cat_id: @cowboy.id)
            @hb = Family.create!(dog_id: @heidi.id, cat_id: @bexley.id)
        end

        it 'destroys an association' do
            visit(family_path(@lc.id))

            expect(page).to have_button('Delete Association')
        end
    end
end