class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end
	def create
		@category = Category.new(categories_params)
		if @category.save
			redirect_to pages_admin_path
  			flash[:success] = "Categoria criada"
 	 	else
  			render action: :new

  		end
	end



	private

	def categories_params
  		params.require(:category).permit(:name)
  	end
end
