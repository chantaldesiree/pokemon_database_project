class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all.page(params[:page])
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

  def show
    @trainer = Trainer.find(params[:id])
    @region = {
      "0"  => "kanto",
      "1"  => "johto",
      "2"  => "hoenn",
      "3"  => "sinnoh",
      "4"  => "unova",
      "5"  => "kalos",
      "6"  => "alola",
      "7"  => "galar" }
    @pokemon = Pokemon.find_by(params[:name])
  end
end
