class FamiliesController < ApplicationController
    def index 
        if params[:dog_id] == nil
            @pet = Cat.find(params[:cat_id])
            @family = @pet.dogs
        elsif params[:cat_id] == nil
            @pet = Dog.find(params[:dog_id])
            @family = @pet.cats
        end
    end

    def new 
    end

    def create 
        require 'pry'; binding.pry
    end
end