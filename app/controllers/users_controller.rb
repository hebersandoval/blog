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
    erb :'/users/login'
  end

  post '/login' do
    # get input for validation
    #redirect to '/posts'
  end

  get '/logout' do
    # session.clear
    # redirect to '/'
  end

end
