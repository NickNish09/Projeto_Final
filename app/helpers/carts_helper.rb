module CartsHelper

    def current_cart
        session[:cart] ||= []
    end
	
    
end
