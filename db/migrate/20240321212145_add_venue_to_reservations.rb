class AddVenueToReservations < ActiveRecord::Migration[7.1]
  def change
    #to add foreign key reference from reservation table in database to another table venue, including the associations between them
    add_reference :reservations, :venues, null: false, foreign_key: true
    add_reference :reservations, :guests, null: false, foreign_key: true
  end
end
