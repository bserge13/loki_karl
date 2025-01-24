class CatsController < ApplicationController
    def index 
        @cats = Cat.all
    end

    def show
        require 'pry'; binding.pry
    end
end