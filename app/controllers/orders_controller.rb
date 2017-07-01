class OrdersController < ApplicationController
	def index
		@orders = Order.all.order("id ASC")
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
		redirect_to orders_path
	end

	private 
	def order_params
  		params.require(:orders).permit(:owner_id)
  	end

	def addorders

	end
end	
