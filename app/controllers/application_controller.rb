class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    #if ! cookies[:email].blank? and cookes[:login].blank?
    #  if cookies[:login] == User.find_by(email: cookies[:email]).id
    #    session[:user] = User.find(cookies[:login])
    #    redirect_to(user_profile_path)
    #  end
    #end
    @buses = Business.all
    @users = User.all
  end
  

end
