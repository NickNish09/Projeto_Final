class OrdersController < ApplicationController
	before_action :require_current_user,only: [:show]
	before_action :require_admin,only: [:index]


	def index
		if(params[:order] == nil)
			@orders = Order.all.order("id ASC")
		else	
			@orders = Order.all.order("#{params[:order]} ASC")
		end
	end

	def show
		@orders = Order.where(:owner_id => params[:id])
		@user = User.find(current_user)
	end
	def new
		@orders = Order.new
	end

	def create #criar um pedido novo
		@orders = Order.new
		current_cart
		@total = 0
		current_cart.each do |h|
			@total += h["quantity"]*h["price"]
		end
		@total

		@orders.owner_id = (params[:owner_id])
		@orders.total = @total
		@orders.status = (params[:status])
		@orders.deliverydate = (params[:date])
		@orders.items = (params[:items])
		if @orders.save
			flash[:success] = "Pedido Realizado!"
	  		redirect_to order_path(current_user.id)
  		else
  		
  		end
	end

	def detail
		@order = Order.find(params[:id])
		@products = []
		@order.items.each do |h|
			pr = Product.find(h["product_id"])
			@products << pr.name
		end
		@products
	end

	def alterstatus
		@order = Order.find(params[:id])
		@order.status = (params[:status])
		@order.save
		redirect_to :back
	end

	private 
	def order_params
  		params.require(:orders).permit(:owner_id)
  	end
  	def require_admin
  		if (!logged_in?) or (logged_in? and !current_user.admin?)
  			flash[:danger] = "So admins podem fazer isso"
  			redirect_to root_path
  		end
  	end
	def require_current_user
		if (!logged_in?) or (params[:id] != current_user.id.to_s) and !current_user.admin?
			flash[:danger] = "Você só pode ver suas compras"
  			redirect_to root_path
  		end	
	end
end	
