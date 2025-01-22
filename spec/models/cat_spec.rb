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
end