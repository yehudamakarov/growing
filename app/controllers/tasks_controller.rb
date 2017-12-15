class TasksController < ApplicationController

  get '/tasks' do
    @tasks = Task.all.sort_by {|t| t.name}
    erb :"tasks/index.html"
  end

  get '/users/:slug/tasks/:day' do
    @user = User.find_by_slug(params[:slug])
    @tasks_of_the_day = @user.day(params[:day])
    @day = Day.find_by(name: params[:day])
    erb :"day_tasks/show.html"
  end


  get '/tasks/id/:id' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    erb :"tasks/show.html"
  end

  get '/tasks/new' do
    @user = current_user
    @days = Day.all
    erb :"tasks/new.html"
  end

  post '/tasks' do
    @user = current_user
    params[:task][:user] = @user
    @task = Task.create(params[:task])

    redirect to("/tasks/id/#{@task.id}")
  end

  get '/tasks/id/:id/edit' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    erb :"tasks/edit.html"
  end

  patch '/' do

  end

  delete '/tasks/id/:id/delete' do
    @task = Task.find_by_id(params[:id])
    @task.day_tasks.each {|d_t| d_t.destroy}
    @task.destroy
    redirect to("/users/#{@task.user.slug}")
  end


end
