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

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
