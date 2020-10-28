class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.page(params[:page])
    @pokemon_types = Pokemon.pluck(:pokemon_type).uniq
  end

  def show
    @pokemon = Pokemon.friendly.find(params[:id])
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
    @pokemon_types = Pokemon.pluck(:pokemon_type).uniq
    wildcard_search = "%#{params[:keywords]}%"
    category_search = "%#{params[:category]}%"

    @count = Pokemon.where("name LIKE ?", wildcard_search).where("pokemon_type LIKE ?", category_search.downcase())
    @pokemons = Pokemon.where("name LIKE ?", wildcard_search).where("pokemon_type LIKE ?", category_search.downcase()).page(params[:page]).per(20)
  end
end
