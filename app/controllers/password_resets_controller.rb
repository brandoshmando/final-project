class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    #Sends email to the user
    @user.deliver_reset_password_instructions! if @user
    redirect_to login_path, notice: "Email has been sent with password reset intructions!"
  end

  def edit
    @user = User.load_from_reset_password_token(params[:id])
    @token = params[:id]

    if @user.blank?
      not_authenticated
      return
    end
  end

  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(params[:token])

    if @user.blank?
      not_authenticated
      return
    end
    @user.password_confirmation = params[:user][:password_confirmation]
    if  @user.change_password!(params[:user][:password])
      redirect_to login_path, notice: "Password was successfully updated!"
    else
      render :edit
    end
  end
end
