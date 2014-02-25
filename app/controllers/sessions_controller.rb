class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(user)
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:warning] = "Logged out!"
    redirect_to root_url
  end
end