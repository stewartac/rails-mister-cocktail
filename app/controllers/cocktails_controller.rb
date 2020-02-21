class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
      if @cocktail.save
        redirect_to cocktails_path
      else
        @cocktails = Cocktail.all
        render :index
      end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
