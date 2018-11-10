class PinsController < ApplicationController
	
	before_action :find_pin, only: [:show,:edit,:update,:destroy]

	def index
		@pins = Pin.all
	end

	def create
		@pin = current_user.pins.new(pin_params)

		if @pin.save
			redirect_to @pin, notice: "Pin successfully created"
		else
			render :new
		end
	end

	def new
		@pin = current_user.pins.new
	end

	def show
	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin successfully updated"
		else
			render "edit"
		end

	end

	def destroy
		@pin.destroy
		redirect_to root_path, notice: "Successfully Deleted the pin"
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

	private

	def pin_params
		params.require(:pin).permit(:name,:description,:image)
	end

end
