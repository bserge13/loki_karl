class CatsController < ApplicationController
    def index 
        @cats = Cat.all
    end

    def show
        @cat = Cat.find(params[:id])
    end

    def create
        Cat.create(cat_params)
        redirect_to(cats_path)
    end

    def edit
        @cat = Cat.find(params[:id])
    end

    def update
        Cat.find(params[:id]).update(cat_params)
        redirect_to cats_path
    end

    def destroy
        Cat.find(params[:id]).destroy
        redirect_to cats_path
    end

    private

    def cat_params
        params.permit(:id, :name, :age, :color)
    end
end