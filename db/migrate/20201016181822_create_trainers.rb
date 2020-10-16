class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :region_id
      t.string :trainer_pokemon

      t.timestamps
    end
  end
end
