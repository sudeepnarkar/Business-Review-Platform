class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index

  #print "--------------------cookies - login ----------------------------"
   p session[:user]
   # print cookies.inspect
    unless session[:user].nil?
      p "happy"
      redirect_to new_review_path
    end
    #if cookies[:login]!=nil
   #   redirect_to user_path(cookies[:login][:value])
  #  end  

    @buses = Business.all
    @users = User.all
  end
  
  

end
