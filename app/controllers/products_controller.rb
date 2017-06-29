class ProductsController < ApplicationController
	#before_action :search_page,only: [:search]

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
	
	private
		def search_page
			redirect_to products_search_path
		end

end
