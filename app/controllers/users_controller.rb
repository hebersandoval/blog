class UsersController < ApplicationController

  get '/signup' do # this route renders the signup form view
    if logged_in? # session[:user_id]
      redirect to '/posts'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do # this route is responsible for receiving the POST request that happens when a user hits "submit" on the form
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password]) # get the new user's info from params, use that info to create and save a new user
      @user.save
      session[:user_id] = @user.id # set the session[:user_id] equal to the new user's ID, effectively logging them in
      redirect to '/posts', locals: {message: "You have signed in."}
    end
  end

  get '/login' do # this route is responsible for rendering the login form
    if logged_in? # session[:user_id]
      redirect to '/posts'
    else
      erb :'/users/login'
    end
  end

  post '/login' do # this route is responsible for receiving the POST request that gets sent when the user hits "submit" on the login form
    @user = User.find_by(username: params[:username]) # the controller route accesses the user's username from params, then searches the db for a user with that info
    if @user && @user.authenticate(params[:password]) # did we find the user with that username and the password matches up w our password_digest? The .authenticate method takes a string as an arg, if the string matches up against the password_digest, it will return the user object.
      session[:user_id] = @user.id # then, that user's ID is stored a the value of session[:user_id]
      redirect to '/posts'
    else
      erb :'users/login', locals: {message: "Incorrect username and/or password."}
    end
  end

  get '/logout' do # this route is responsible for logging the user out by clearing the session hash
    if logged_in? # session[:user_id] != nil
      session.clear # clearing the content of the session hash, including the :user_id
      redirect to '/login', locals: {message: "You are logged off."}
    else
      redirect to '/'
    end
  end

end
