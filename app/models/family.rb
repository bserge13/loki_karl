class Family < ApplicationRecord
    belongs_to :cat
    belongs_to :dog

    def name
        # require 'pry'; binding.pry
        dog = Dog.find_by(id: self.dog_id)
        cat = Cat.find_by(id: self.cat_id)
        return "#{dog.name} and #{cat.name}"
    end
end