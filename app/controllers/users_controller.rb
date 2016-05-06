class UsersController < ApplicationController

  get '/signup' do
    if session[:user_id]
      redirect to '/posts'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/posts'
    end
  end

  get '/login' do
    if session[:user_id]
      redirect to '/posts'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/posts'
    else
      erb :'users/login'
    end
  end

  get '/logout' do
    # session.clear
    # redirect to '/'
  end

end
