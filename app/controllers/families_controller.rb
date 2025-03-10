class FamiliesController < ApplicationController
    def index
        if params[:cat_id].nil? && params[:dog_id].nil?
            # All Families
            @family = Family.all
            # require 'pry'; binding.pry
        elsif params[:dog_id].nil?
            # Cat Index route
            @pet = Cat.find(params[:cat_id])
            @family = @pet.dogs
        elsif params[:cat_id].nil?
            # Dog Index route
            @pet = Dog.find(params[:dog_id])
            @family = @pet.cats
        end
    end

    def new 
        @dogs = Dog.all
        @cats = Cat.all 
    end

    def create 
        Family.create(familiy_params)
        redirect_to all_families_path
    end

    private 

    def familiy_params
        params.permit(:id, :cat_id, :dog_id)
    end
end