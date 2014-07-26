class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user login(params[:email], params[:password])

      redirect_back_or_to :user, notice: "You are now logged in as #{@user.first_name}"
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