require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions # a hash that stores data on the server, and passes the data to the client as a cookie
    set :session_secret, 'secret' # is an encryption key that will be used to create a session_id. A session_id is a unique string of letters and numbers that is unique per session and is stored in the browser cookie
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in? # returns true or false based on the presence of a session[:user_id]
      # session[:user_id] => nil
      # !session[:user_id] => true
      # !!session[:user_id] => false
      !!session[:user_id] # in order to keep track of a current user throughout a session, set up the session hash to store the :user_id in the hash during a controller action
    end

    def current_user #current_user returns the instance of the logged in user, based on the session[:user_id]
      User.find(session[:user_id])
    end
  end
end
