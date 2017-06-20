class SessionsController < ApplicationController
  #before_action :block_acess, except: [:destroy]

  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
                if @user && @user.authenticate(params[:session][:password])
                    sign_in #@user
                	flash[:success] = "Você logou"
                  #redirect_to @user
                	redirect_to root_path
                else
                  flash.now[:danger] = "Erro ao Logar"
                	render 'new'
                end		
  end
  def destroy
    sign_out
    redirect_to root_url
  end
end
