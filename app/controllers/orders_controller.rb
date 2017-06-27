class OrdersController < ApplicationController
	def index
		#@orders = Order.find(params[:owner_id]) #todos os pedidos desse usuario
		@orders = Order.all
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
		@orders.owner_id = (params[:owner_id])
		@orders.total = (params[:total])
		@orders.status = (params[:status])
		@orders.deliverydate = (params[:date])
		if @orders.save
			flash[:success] = "Pedido Realizado!"
	  		redirect_to order_path(current_user.id)
  		else
  		
  		end
	end


	private 
	def order_params
  		params.require(:orders).permit(:owner_id)
  	end

	def addorders

	end
end	
