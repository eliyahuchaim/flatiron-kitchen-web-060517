require 'pry'

class RecipesController < ApplicationController

    before_action :find_recipe, only: [:edit, :show, :update]

    def new
      @recipe = Recipe.new
      @ingredients = Ingredient.all
    end

    def create
      @recipe = Recipe.create(recipe_params)

      params["ingredient"].each do |k, v|
        @recipe.ingredients << Ingredient.find(k) if v == "yes"
      end
      @recipe.save
      redirect_to @recipe
    end

    def edit

    end

    def show

    end

    def update
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
