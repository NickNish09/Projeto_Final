module CartsHelper
	def cart_in 
         cart[:cart_id] = @cart.id
     end

     def current_cart
            @current_cart ||= Cart.find_by(id: cart[:cart_id])
     end
end
