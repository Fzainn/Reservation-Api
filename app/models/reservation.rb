class Reservation < ApplicationRecord

	#Each reservation is associated with a specific venue and specific guest
	#this implies in db schema, in 'reservation' table there are a columm called 'venue_id' and 'guest_id'
	#which store the id for this specific venue and id, that represents that reservation belongs to this venue and this guest
	belongs_to :venue
	belongs_to :guest

	validates :guest_count, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
