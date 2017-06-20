class OrdersController < ApplicationController
	def index
		#@orders = Order.find(params[:owner_id]) #todos os pedidos desse usuario
		@orders = Order.all
	end

	def show
		@orders = Order.where(:owner_id => params[:id])
		#@user = User.find(params[:id])
		@user = User.find(current_user)
	end
	def new
		@orders = Order.new
	end

	def criar #criar um pedido novo
		@orders = Order.new
		@orders.owner_id = (params[:owner_id])
		if @orders.save
  		redirect_to @orders, notice: "Pedido Realizado!"
  		#sign_in(@user)
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
