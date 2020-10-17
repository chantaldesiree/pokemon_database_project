class Trainer < ApplicationRecord
    has_many :pokemons
    belongs_to :regions

    validates :name, :region_id, :trainer_pokemon, presence: true
end
