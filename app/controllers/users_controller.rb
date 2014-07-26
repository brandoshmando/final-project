class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:create]
  def create
    #Will need this later
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "Your changes were saved!"
    else
      flash.now[:alert] = "Your changes were not saved..."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
    private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
