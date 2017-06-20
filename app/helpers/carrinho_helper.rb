module CarrinhoHelper
	def session_cart
        session[:cart] = []
    end

     def current_cart
            @current_cart = Cart.find(5)
            #@current_cart ||= []
            
     end

end
