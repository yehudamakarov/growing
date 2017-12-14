class TasksController < ApplicationController

  get '/users/:slug/tasks/:day' do
    @user = User.find_by_slug(params[:slug])
    @day_tasks = @user.day(params[:day])
    @day = params[:day].capitalize
    erb :"day_tasks/show.html"
  end

  get '/tasks/id/:id' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    erb :"tasks/show.html"
  end

  get '/tasks/id/:id/edit' do
    @task = Task.find_by_id(params[:id])
    @user = @task.user
    erb :"tasks/edit.html"
  end

  get '/tasks/new' do
    @user = current_user
    erb :"tasks/new.html"
  end

  post '/tasks' do
    binding.pry
  end


end
