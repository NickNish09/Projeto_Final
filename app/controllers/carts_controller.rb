class CartsController < ApplicationController
	def criar
		@carts = Cart.find(1)
		cart_in
	end

	def show
		@carts = Cart.find(params[:id])
	end

	def addtocart 
		@carts = Cart.find(5)
		@products = Product.find(params[:product])
		quantidade = params[:quantity].to_i
		@carts.add(@products,@products.price,quantidade)
		redirect_to cart_path(@carts.id)
	end

	def limpar
		@carts = Cart.find(params[:id])
		@carts.clear
		#redirect_to root_path
		redirect_to cart_path(@carts.id)
	end

	def aumentarqtd
		@carts = Cart.find(params[:id])
		@products = Product.find(params[:product])
		@carts.add(@products,@products.price)
		redirect_to :back
	end
	def diminuirqtd
		@carts = Cart.find(params[:id])
		@products = Product.find(params[:product])
		@carts.remove(@products,1)
		redirect_to :back
	end
end
