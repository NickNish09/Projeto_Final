class ProductsController < ApplicationController
	#before_action :search_page,only: [:search]

	def show

	end
	def index
		@products = Product.all
		
	end

	def condimentos
		#@products = Product.where(:categories => 'condimentos')
		@products = Product.joins(:categories).where(:categories => {:id => 2})
	end
	def cafedamanha
		#@products = Product.where(:categories => 'cafedamanha')
		@products = Product.joins(:categories).where(:categories => {:id => 1})
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
