class CartsController < ApplicationController
	def criar
		@carts = Cart.find(1)
		cart_in
	end

	def show
		@carts = Cart.find(params[:id])
	end
end
