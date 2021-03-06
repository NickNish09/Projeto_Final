class CartsController < ApplicationController
	

	def addtocart
		#cart = current_cart
		@products = Product.find(params[:product])
		if (!current_cart.empty? && current_cart.any?{|h| h["product_id"] == @products.id})
			flash[:danger] = "Produto já consta no carrinho"
		else
			current_cart << {product_id: @products.id,quantity: 1,price: @products.price}
			flash[:success] = "Produto adicionado"
		end
		redirect_to :back
	end
	def remove
		@products = Product.find(params[:product])
		current_cart.delete_if{|h| h["product_id"] == @products.id}

		redirect_to carts_show_path
	end

	def rise
		@product = Product.find(params[:product])
		current_cart.map do |h|
		 	if h["product_id"] == @product.id
		 		h["quantity"] += 1
		 	end
		end
		respond_to do |format|
			format.html{ redirect_to carts_show_path}
			
			format.js
		end
		#redirect_to carts_show_path
		
	end
	def low
		@product = Product.find(params[:product])
		current_cart.map do |h|
		 	if h["product_id"] == @product.id
		 		if h["quantity"] != 0
		 			h["quantity"] -= 1
		 		end
		 	end
		end
		respond_to do |format|
			format.html{ redirect_to carts_show_path}
			
			format.js
		end
		#redirect_to carts_show_path
		
	end

	def destroy
		current_cart.clear
		redirect_to carts_show_path
	end

	def show
		@products = []
		if (!current_cart.empty?)
			current_cart.each do |h|
				pr = Product.find(h["product_id"])
				@products << {:id => pr.id,:name => pr.name,:description => pr.description,:price => pr.price,:quantity => h["quantity"]}
				#@products << h["product_id"]
			end
		end
		@cart = current_cart
		@total = 0
		current_cart.each do |h|
			@total += h["quantity"]*h["price"]
		end
		@total
	end
end
