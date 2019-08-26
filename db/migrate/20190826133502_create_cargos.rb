class CreateCargos < ActiveRecord::Migration[5.2]
  def change
    create_table :cargos do |t|
      t.string :cargo_name
      t.string :load_location
      t.string :cargo_type
      t.integer :volume
      t.string :discharge_location
      t.date :cargo_load_window
      t.boolean :gas_free
      t.references :oil_company, foreign_key: true
      t.string :load_latitude
      t.string :load_longitude

      t.timestamps
    end
  end
end
