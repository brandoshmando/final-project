class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:create, :activate]

  def activate
    if (@user = User.load_from_activation_token(params[:id])
      @token = params[:id]
    else
      not_authenticated
    end
  end

  def confirm
    @token = params[:token]
    if @user = User.load_from_activation_token(@token)
      if @user.update_attributes(user_params).only(:token)
        @user.activate!
        redirect_to login_path, notice: "#{@user.first_name} was activated successfully!"
      else
        render :activate
      end
    else
      not_authenticated
    end
  end

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

    if @user.update(user_params).except(:token)
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
    params.require(:user).permit(:first_name, :last_name, :email, :token)
  end
end
