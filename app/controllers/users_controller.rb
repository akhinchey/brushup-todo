class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render "new"
    end 
  end 

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end
