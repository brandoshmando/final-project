class UsersController < ApplicationController
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
end
