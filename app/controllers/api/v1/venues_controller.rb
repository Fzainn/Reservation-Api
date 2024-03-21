module Api
	module V1
		class VenuesController < ApplicationController
			before_action :find_venue, only: show
			def index
				venues = Venue.all
				render json: {venues: venues}, status: :ok
			end	

			def show
				render json: {venue: @venue}, status: :ok

			end	




			private
			def find_venue
				@venue = Venue.find(params[:venue_id])
				render json: { errors: 'venue not found'}, status: :not_found unless @venue		
			end

		end
	end		
end		