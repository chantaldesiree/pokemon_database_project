class AddSpritesToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :pokemon_front, :string
  end
end
