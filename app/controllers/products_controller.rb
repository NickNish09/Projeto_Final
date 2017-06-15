class ProductsController < ApplicationController
	def show

	end
	def index
		@products = Product.all
	end

	def condimentos
		@products = Product.where(:categories => 'condimentos')
	end
	def cafedamanha
		@products = Product.where(:categories => 'cafedamanha')
	end

end
