class AddAgeGenderToTrainer < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :age, :integer
    add_column :trainers, :gender, :string
  end
end
