class ProductsController < ApplicationController
	#before_action :search_page,only: [:search]

	def show

	end
	def index
		@products = Product.all
		
	end
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(products_params)
		if @product.save
			redirect_to pages_admin_path
  			flash[:success] = "Produto criado"
 	 	else
  			render action: :new

  		end
	end

	def edit
		@product = Product.find(params[:id])
	end
	def update
      @product = Product.find(params[:id]) 
      if @product.update_attributes(products_params)
        redirect_to pages_admin_path
        flash[:success] = "Produto Atualizado"
      else
        render action: :edit
      end
  	end

	def condimentos
		@products = Product.joins(:categories).where(:categories => {:name => "condimentos"})
	end
	def cafedamanha
		@products = Product.joins(:categories).where(:categories => {:name => "cafedamanha"})
	end
	def carros
		@products = Product.joins(:categories).where(:categories => {:name => "carros"})
	end

	def get
		#redirect_to products_search_path
	end
	
	def findcategory
		@products = Product.joins(:categories).where(:categories => {:name => params[:categoryname]})
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

		def products_params
  			params.require(:product).permit(:name, :description, :price)
  		end

end
