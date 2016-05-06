class PostsController < ApplicationController

  get '/posts' do
    erb :'posts/index'
  end

end
