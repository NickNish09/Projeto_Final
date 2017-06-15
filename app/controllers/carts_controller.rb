class CartsController < ApplicationController
	def show
		#@cart = Cart.find(params[:id])
		@cart = Cart.current_cart
	end

end
