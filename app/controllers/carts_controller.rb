class CartsController < ApplicationController
	

	def addtocart
		cart = current_cart
		@products = Product.find(params[:product])
		cart << {product_id: @products.id,quantity: 1,price: @products.price}
		redirect_to :back
	end
	def remove(product,cart)
		cart.delete(product)
	end

	def show
		@product = Product.find(1)
	end
end
