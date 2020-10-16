class Trainer < ApplicationRecord
    validates :name, :region_id, :trainer_pokemon, presence: true
end
