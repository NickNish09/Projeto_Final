class ProductsController < ApplicationController
	before_action :require_admin, only: [:new,:create, :edit,:update]

	def show

	end
	def index
		if(params[:order] == nil)
			@products = Product.all.order("id ASC")
		else	
			if params[:order] == 'pricemaior'
				x = 'DESC'
				params[:order] = 'price'
			else
				x = 'ASC'
			end
			@products = Product.all.order("#{params[:order]} "+x)
		end
		
	end
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(products_params)
		if @product.save
			params[:categorias].each do |cat|
				catigo = Category.find_by(name: cat)
				@protegory = Protegory.new(category_id: catigo.id,product_id: @product.id)
				@protegory.save
			end
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
  			params.require(:product).permit(:name, :description, :price,:sellable)
  		end
  		def require_admin
  			if (!logged_in?) or (logged_in? and !current_user.admin?)
  				flash[:danger] = "So admins podem fazer isso"
  				redirect_to root_path
  			end
  		end
end
