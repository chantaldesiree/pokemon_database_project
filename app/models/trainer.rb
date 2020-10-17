class Trainer < ApplicationRecord
    has_many :pokemons
    validates :name, :region_id, :trainer_pokemon, presence: true
end
