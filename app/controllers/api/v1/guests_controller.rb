module Api
	module V1
		class GuestsController < ApplicationController
			before_action :find_guest, only: %i[index show]

			def index
				guest = Guest.all
				render json: {guests:guests}, status: :ok
			end	

			def show
				render json: {guest:@guest}, status: :ok
			end	




			private
			def find_guest
				@guest = Guest.fing(params[:id])
				render json: {errors: ['not found']}, status: :not_found unless @guest
			end	
		end	
	end	
end		
