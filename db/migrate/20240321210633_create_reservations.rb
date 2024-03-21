class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_at, null:false
      t.datetime :end_at, null:false
      t.integer :guest_count, null:false


      t.timestamps
    end
  end
end
