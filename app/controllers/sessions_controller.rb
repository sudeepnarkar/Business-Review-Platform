class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      p "Login successful"
      redirect_to user_path
      # Log the user in and redirect to the user's show page.
    else
      p "Login failure"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end



  def destroy
  end
end
