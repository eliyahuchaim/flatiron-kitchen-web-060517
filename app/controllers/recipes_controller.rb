require 'pry'

class RecipesController < ApplicationController

    before_action :find_recipe, only: [:edit, :show, :update]

    def new
      @recipe = Recipe.new
      @ingredients = Ingredient.all
    end

    def create
      @recipe = Recipe.create(recipe_params)
      if !params[:recipe][:ingredients].nil?
        params[:recipe][:ingredients].each do |id|
          @recipe.ingredients << Ingredient.find(id)
        end
      end
      redirect_to @recipe
    end

    def edit

    end

    def show

    end

    def update
      @recipe.ingredients = []
      if !params[:recipe][:ingredients].nil?
        params[:recipe][:ingredients].each do |id|
          @recipe.ingredients << Ingredient.find(id)
        end
      end
      @recipe.update(recipe_params)
      redirect_to @recipe
    end

    private

    def recipe_params
      params.require(:recipe).permit(:name)
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

end
