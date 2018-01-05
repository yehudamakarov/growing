require 'rack-flash'
class UsersController < ApplicationController

use Rack::Flash

  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end


  get "/users/:slug/edit" do
    if logged_in? && User.find_by_slug(params[:slug]) == current_user
      @user = current_user
      erb :"/users/edit.html"
    else
      flash[:message] = "Maybe you need to be logged in to do that."
      redirect to("/users/#{current_user.slug}")
    end
  end


  patch "/users/:slug" do
    if User.find_by_slug(params[:slug]) == current_user && logged_in?
      @user = User.find_by_slug(params[:slug])
      @user.update(params[:user])
      redirect "/users/#{@user.slug}"
    else
      redirect to('/')
    end
  end


  delete "/users/:slug/delete" do
    @user = User.find_by_slug(params[:slug])
    @user.delete_all_tasks
    @user.destroy
    session.clear
    redirect "/"
  end
end
