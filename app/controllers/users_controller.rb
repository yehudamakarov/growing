class UsersController < ApplicationController

  # GET: /users
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
      redirect to("/users/#{current_user.slug}")
    end
  end


  patch "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    @user.update(params[:user])
    redirect "/users/#{@user.slug}"
  end


  delete "/users/:slug/delete" do
    @user = User.find_by_slug(params[:slug])
    @user.delete_all_tasks
    @user.destroy
    session.clear
    redirect "/"
  end
end
