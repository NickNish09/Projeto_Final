module CartsHelper
	def cart_in 
         session[:cart_id] = @cart.id
     end

     def current_cart
            @current_cart = Cart.find(5)
            #@current_cart ||= Cart.find_by(id: session[:cart_id])
            #@current_cart = Cart.create
            #@product = Product.find(1)
            #@current_cart.add(@product,@product.price)
     end
end
