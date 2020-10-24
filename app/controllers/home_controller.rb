class HomeController < ApplicationController
  def index
    @trainers = Trainer.limit(10)

    @pokemons = Pokemon.limit(10)
  end
end
