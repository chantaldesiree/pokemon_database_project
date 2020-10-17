class Pokemon < ApplicationRecord
    has_many :trainers
    validates :name, :region_id, :pokemon_type, presence: true
end
