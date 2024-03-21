module Api
	module V1
		class ReservationsController < ApplicationController
			before_action :find_venue, only: %i[create index]
			before_action :find_reservation, only: :show
			before_action :find_guest, only: :create

			def create
				#@venue->instance variable from a venue model, which represents a specific record in venue table
				#@venue.reservations->assumes the association between venue and reservations
				#.build->method to create a new instance (reservation) without saving it to the db immediately
				#reservation_params.merge!(guest_id: @guest_id)->to merge additional attribute into reservation_params
				reservation = @venue.reservations.build(reservation_params.merge!(guest_id: @guest_id))
				if reservation.save
					#if reservation created sucessfully, the request will return a json with the reservation value created newly
					render json: {reservation:reservation}, status: :created
				elsif
					render json: {errors: reservation.errors.messages}, status: :unprocessable_entity
				end 
			end

			def show
				render json: {reservation: @reservation}, status: :ok
			end

			def index
				#show all reservation for a specific venue
				reservations= @venue.reservations
				render json: {reservations: reservations}, status: :ok
			end	



			private
			def find_venue
				@venue = Venue.find(params[:venue_id])
				render json: { errors: 'venue not found'}, status: :not_found unless @venue		
			end

			def find_reservation
				@reservation = Reservation.find(params[:id])
				render json: {errors: ['reservation not found']}, status: :not_found unless @reservation
			end	

			def reservation_params
				params.require(:reservation).permit(:start_at, :end_at, :guest_count)
			end	
		end	
	end
end	


