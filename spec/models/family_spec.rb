require 'rails_helper'

RSpec.describe Family, type: :model do
    describe 'relationships' do
        it { should belong_to :cat }
        it { should belong_to :dog }
    end

    describe 'model methods' do 
        it '#name' do 
            @karl = Cat.create!(name: 'Karl', age: 1, color: 'Brown')
            @loki = Dog.create!(name: 'Loki', age: 5, color: 'Blue')
            fam = Family.create!(dog_id: @loki.id, cat_id: @karl.id)

            expect(fam.name).to eq("#{@loki.name} and #{@karl.name}")
        end
    end
end