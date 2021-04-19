class AddBackSpriteToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :pokemon_back, :string
  end
end
