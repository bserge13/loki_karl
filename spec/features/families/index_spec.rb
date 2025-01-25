require 'rails_helper'

RSpec.describe 'Families Features', type: :feature do 
    describe 'Families page' do
        before :each do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Grey')
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
        end
        it 'has an index of a cats associated dogs' do
            visit "/cats/#{@karl.id}"
        end
        
        xit 'has an index of a dogs associated cats' do
            visit "/dogs/#{@loki.id}"

        end
    end
end