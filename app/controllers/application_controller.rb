class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_cart

  include SessionsHelper
  #include CartsHelper

  def current_cart
        session[:cart] ||= []
   end

  def authorize
        unless logged_in?
          redirect_to root_url
        end
  end
  def correct_user?
        @user = User.find(params[:id])
            unless current_user == @user
                redirect_to users_path
            end
  end

  def categories
    categories = Category.all
  end
end
