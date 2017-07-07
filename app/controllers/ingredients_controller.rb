class IngredientsController < ApplicationController

  before_action :find_ingredient, only: [:edit, :show, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def edit

  end

  def show

  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
