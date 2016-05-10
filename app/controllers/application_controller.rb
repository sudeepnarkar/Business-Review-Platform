class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    unless session[:user].nil?
      redirect_to new_review_path
    end
    
    
    @buses = Business.all
    @users = User.all
  end
  

end
