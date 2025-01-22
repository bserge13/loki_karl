class Dog < ApplicationRecord
    validates_presence_of :name, :color
    validates_numericality_of :age
    has_many :families
    has_many :cats, through: :families
end