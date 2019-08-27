class CreateBarges < ActiveRecord::Migration[5.2]
  def change
    create_table :barges do |t|
      t.string :barge_name
      t.integer :capacity
      t.string :pre_cargo
      t.string :barge_type
      t.boolean :gas_free
      t.string :barge_area
      t.date :barge_load_window
      t.references :broker, foreign_key: true

      t.timestamps
    end
  end
end
