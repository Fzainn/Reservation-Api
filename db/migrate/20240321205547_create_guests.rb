class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :phone, null:false
      t.string :address, null:false
      t.string :age, null:false



      t.timestamps
    end
  end
end
