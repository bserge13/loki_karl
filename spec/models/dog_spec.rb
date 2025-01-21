require 'rails_helper'

RSpec.describe Dog, type: :model do 
    describe 'relationships' do 
        ...
    end

    describe 'validations' do 
        it { should validate_presence_of :name }
        it { should validate_presence_of :age }
        it { should validate_presence_of :color }
    end
end