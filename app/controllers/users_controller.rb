class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    # get input from user via params also provide validations
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
