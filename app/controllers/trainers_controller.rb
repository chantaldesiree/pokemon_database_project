class TrainersController < ApplicationController


  def index
    @trainers = Trainer.all
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
  end
end
