class Region < ApplicationRecord
  has_many :trainers
  has_many :pokemons
end
