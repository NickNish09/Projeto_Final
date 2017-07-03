class CategoriesController < ApplicationController
	before_action :require_admin,only: [:new,:create]

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
  	def require_admin
  		if (!logged_in?) or (logged_in? and !current_user.admin?)
  			flash[:danger] = "So admins podem fazer isso"
  			redirect_to root_path
  		end
  	end
end
