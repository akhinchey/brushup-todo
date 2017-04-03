class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.new(list_params)
    if @list.save
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
