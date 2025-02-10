require 'rails_helper'

RSpec.describe Cat, type: :model do 
    describe 'relationships' do
        it { should have_many :families }
        it { should have_many(:dogs).through(:families) }
    end

    describe 'validations' do 
        it { should validate_presence_of :name }
        it { should validate_numericality_of :age }
        it { should validate_presence_of :color }
    end

    describe 'model methods' do
        it '#average_cat_age' do
            Cat.create!(name: 'Logan', age: 2, color: 'Black')
            Cat.create!(name: 'Chester', age: 5, color: 'Orange')
            Cat.create!(name: 'Karl', age: 2, color: 'Brown')

            expect(Cat.average_cat_age).to eq(3)
        end
    end
end