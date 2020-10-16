class Pokemon < ApplicationRecord
    validates :name, :region_id, :pokemon_type, presence: true
end
