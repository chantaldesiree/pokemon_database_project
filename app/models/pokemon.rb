class Pokemon < ApplicationRecord
    has_many :trainers
    belongs_to :region

    validates :name, :region_id, :pokemon_type, presence: true
end
