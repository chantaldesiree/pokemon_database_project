class Region < ApplicationRecord
  belongs_to :trainers
  belongs_to :pokemons

  validates :name, presence: true
end
