class Trainer < ApplicationRecord
    paginates_per 25

    has_many :pokemons
    belongs_to :regions, optional: true

    validates :name, :region_id, :trainer_pokemon, presence: true
end
