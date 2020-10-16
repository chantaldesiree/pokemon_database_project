class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @pokemons = Pokemon.where("name LIKE ?", wildcard_search)
  end
end
