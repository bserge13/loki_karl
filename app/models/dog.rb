class Dog < ApplicationRecord
    validates_presence_of :name, :color
    validates_numericality_of :age
end