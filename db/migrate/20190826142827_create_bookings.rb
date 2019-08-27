class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.bigint  :booker_cargo_id
      t.bigint  :booked_cargo_id
      t.bigint  :booker_barge_id
      t.bigint  :booked_barge_id

      t.integer :freight_rate
      t.integer :free_hours
      t.integer :demurrage_rate
      t.boolean :short_notice
      t.text :comment

      t.timestamps
    end
  end
end
