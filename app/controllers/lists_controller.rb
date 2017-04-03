class ListsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
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
      @errors = @list.errors.full_messages
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to user_path(@user)
    else
      @errors = @list.errors.full_messages
      render "edit"
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
