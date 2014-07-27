class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_to @user, notice: "You have been logged in succesfully"
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice:"See you next time!"
  end
end