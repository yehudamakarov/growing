require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  end

  get "/" do
    erb :index
  end

  get '/signup' do
    unless logged_in?
      erb :signup
    else
      redirect to("/users/#{current_user.slug}")
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect to("/users/#{@user.slug}")
    else
      redirect to('/signup')
    end
  end

  get '/login' do
    unless logged_in?
      erb :login
    else
      redirect to("/users/#{current_user.slug}")
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    @user ||= User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to("/users/#{@user.slug}")
    else
      redirect to('/login')
    end
  end

  get '/logout' do
    session.clear
    redirect to('/')
  end

end
