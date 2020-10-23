class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @region = {
      "0"  => "kanto",
      "1"  => "johto",
      "2"  => "hoenn",
      "3"  => "sinnoh",
      "4"  => "unova",
      "5"  => "kalos",
      "6"  => "alola",
      "7"  => "galar" }
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @pokemons = Pokemon.where("name LIKE ?", wildcard_search)
  end
end
