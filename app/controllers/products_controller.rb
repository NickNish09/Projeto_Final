class ProductsController < ApplicationController
	def show

	end
	def index
		@products = Product.all
		#@carts = Cart.find(5)
	end

	def condimentos
		@products = Product.where(:categories => 'condimentos')
		#@carts = Cart.find(5)
	end
	def cafedamanha
		@products = Product.where(:categories => 'cafedamanha')
		#@carts = Cart.find(5)
	end
	
	def get
		#redirect_to products_search_path
	end
	

	def search
		
		@products = Product.all
		  if params[:search]
		    @products = Product.search(params[:search]).order("created_at DESC")
		  else
		    @products = Product.all.order('created_at DESC')
		  end
	end
end
