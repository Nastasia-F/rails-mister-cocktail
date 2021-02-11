class CocktailsController < ApplicationController
  def show
    @cocktails = Cocktail.all
  end

  def new
    @Cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create

  end
end
