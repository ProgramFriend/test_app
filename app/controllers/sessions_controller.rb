class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Tu prisijungei! Atsipalaiduok.... ir mėgaukis....:)"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Turbūt kažką įvedei neteisingai :), pabandyk dar kartą!"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    flash[:success] = "Tu atsijungei, lauksime sugrįžtant!"
    redirect_to root_path
  end
  
end