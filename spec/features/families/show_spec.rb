require 'rails_helper'

RSpec.describe 'Families Features', type: :feature do 
    describe 'Families page' do
        before :each do 
            @cowboy = Cat.create!(name: 'Cowboy', age: 1, color: 'Grey')
            @bexley = Cat.create!(name: 'Bexley', age: 1, color: 'Brown')

            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            @heidi = Dog.create!(name: 'Heidi', age: 10, color: 'White')

            Family.create!(dog_id: @loki.id, cat_id: @cowboy.id)
            Family.create!(dog_id: @heidi.id, cat_id: @bexley.id)
        end
    end 
end 