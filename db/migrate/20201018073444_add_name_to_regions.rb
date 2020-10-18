class AddNameToRegions < ActiveRecord::Migration[6.0]
  def change
    change_table :regions do |t|
     t.string :name
    end

  end
end
