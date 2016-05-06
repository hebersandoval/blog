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
      redirect to '/posts', locals: {message: "You have signed in."}
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
      erb :'users/login', locals: {message: "Incorrect username and/or password."}
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.clear
      redirect to '/login', locals: {message: "You are logged off."}
    else
      redirect to '/'
    end
  end

end
