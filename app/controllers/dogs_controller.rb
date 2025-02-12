class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def create
        Dog.create(dog_params)
        redirect_to dogs_path
    end

    def edit 
        @dog = Dog.find(params[:id])
    end

    def update
        # require 'pry'; binding.pry
        Dog.find(params[:id]).update(dog_params)
        redirect_to dogs_path
    end

    private 

    def dog_params
        params.permit(:id, :name, :age, :color)
    end
end