class AddCoordinatesToBarges < ActiveRecord::Migration[5.2]
  def change
    add_column :barges, :latitude, :float
    add_column :barges, :longitude, :float
  end
end
