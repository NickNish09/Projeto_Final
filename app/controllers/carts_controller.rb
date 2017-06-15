class CartsController < ApplicationController
	def criar
		@carts = Cart.find(1)
		cart_in
	end

	def show
		@carts = Cart.find(params[:id])
	end

	def addtocart 
		@carts = Cart.find(5)
		@products = Product.find(params[:product])
		@carts.add(@products,@products.price)
		redirect_to cart_path(@carts.id)
	end
end
