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
    erb :signup
  end

  post '/signup' do
    @user = User.new(params)
binding.pry
    if @user.save
      session[:user_id] = @user.id
      redirect to("/user/#{@user.slug}")
    else
      redirect to('/signup')
    end
  end

  get '/login' do
    erb :login
  end

end
