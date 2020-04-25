class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to root_url, notice:"Thank you for signing up!"
      flash[:notice] = "Thank you for signing up"
      redirect_to :controller => 'articles', :action => 'index'
    else

      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
