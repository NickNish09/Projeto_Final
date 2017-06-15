class ProductsController < ApplicationController
	def show

	end
	def index
		@products = Product.all
		@carts = Cart.find(5)
	end

	def condimentos
		@products = Product.where(:categories => 'condimentos')
		@carts = Cart.find(5)
	end
	def cafedamanha
		@products = Product.where(:categories => 'cafedamanha')
		@carts = Cart.find(5)
	end
	

end
