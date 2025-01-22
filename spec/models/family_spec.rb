require 'rails_helper'

RSpec.describe Family, type: :model do
    describe 'relationships' do
        it { should belong_to :cat }
        it { should belong_to :dog }
    end
end