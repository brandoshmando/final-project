class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #Test comment for git. Delete if you see this...
  protect_from_forgery with: :exception
  before_filter :require_login

  def not_authenticated
    redirect_to login_path
  end
end
