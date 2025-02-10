require 'rails_helper'

RSpec.describe Dog, type: :model do 
    describe 'relationships' do 
        it { should have_many :families }
        it { should have_many(:cats).through(:families) }
    end

    describe 'validations' do 
        it { should validate_presence_of :name }
        it { should validate_numericality_of :age }
        it { should validate_presence_of :color }
    end

    describe 'model methods' do
        it '#average_age' do
            Dog.create!(name: 'Kevin', age: 2, color: 'Yellow')
            Dog.create!(name: 'Loki', age: 5, color: 'Gray')
            Dog.create!(name: 'Nova', age: 6, color: 'Brown')

            expect(Dog.average_age).to eq(4.33)
        end
    end
end