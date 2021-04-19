class HomeController < ApplicationController
  def index
    @trainers = Trainer.limit(20)

    @pokemons = Pokemon.limit(20)
  end
end
