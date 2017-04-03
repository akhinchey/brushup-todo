class TasksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
  end

  def create
    user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    task = @list.tasks.new(task_params)
    p task 
    if task.save
      redirect_to user_list_path(user, @list)
    else
      @errors = task.errors.full_messages
      render "new"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_list_path(@user, @list)
    else
      @errors = @task.errors.full_messages
      render "edit"
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :list_id)
  end

end
