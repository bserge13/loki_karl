class Cat < ApplicationRecord
    validates_presence_of :name, :color
    validates_numericality_of :age
    has_many :families
    has_many :dogs, through: :families
end