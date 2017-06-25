module CartsHelper

    def current_cart
        session[:cart] ||= []
    end
	def rise(idd)
		@product = Product.find(idd)
		current_cart.map do |h|
		 	if h["product_id"] == @product.id
		 		h["quantity"] += 1
		 	end
		end
	end
    
end
