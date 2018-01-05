require 'rack-flash'
class TasksController < ApplicationController

  use Rack::Flash

  get '/tasks' do
    @tasks = Task.all.sort_by {|t| t.name}
    erb :"tasks/index.html"
  end

  get '/users/:slug/tasks/:day' do
    @user = User.find_by_slug(params[:slug])
    @tasks_of_the_day = @user.day(params[:day])
    @day = Day.find_by(name: params[:day])
    erb :"day_of_the_week_tasks/show.html"
  end


  get '/tasks/id/:id' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    erb :"tasks/show.html"
  end

  get '/tasks/new' do
    @user = current_user
    @days = Day.all
    if request.referer.include?("#{@user.slug}/tasks")
      which_day_adding_a_task_to = request.referer.match(/[^\/]+$/).to_s.delete("?")
      @precheck = which_day_adding_a_task_to
    end
    erb :"tasks/new.html"

  end

  post '/tasks' do
    @user = current_user
    params[:task][:user] = @user
    @task = Task.new(params[:task])
    if @task.save
      redirect to("/tasks/id/#{@task.id}")
    else
      flash[:message] = "Maybe you forgot to name your task."
      redirect to('/tasks/new')
    end
  end

  get '/tasks/id/:id/edit' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    @days = Day.all
    if current_user == @user
      erb :"tasks/edit.html"
    else
      redirect to("/users/#{current_user.slug}")
    end
  end

  patch '/tasks/id/:id' do
    @task = Task.find_by_id(params[:id])
    @task.update(params[:task])
    if @task.save
      redirect to("/tasks/id/#{@task.id}")
    else
      flash[:message] = "Maybe you forgot to name your task."
      redirect to("/tasks/id/#{@task.id}/edit")
    end
  end

  delete '/tasks/id/:id/delete' do
    @task = Task.find_by_id(params[:id])
    if current_user == @task.user
      @task.day_tasks.each {|d_t| d_t.destroy}
      @task.destroy
      redirect to("/users/#{@task.user.slug}")
    else
      flash[:message] = "Maybe you need to be logged in to do that."
      redirect to("/users/#{current_user.slug}")
    end

  end


end
