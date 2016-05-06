class PostsController < ApplicationController

  get '/posts' do
    erb :'posts/index'
  end

  get '/posts/new' do # create action
    erb :'posts/new'
  end

  post '/posts' do
    # get input from user via params
  end

  get '/posts/:id' do # show action
    erb :'posts/show'
  end

  get '/posts/:id/edit' do # update action
    erb :'/posts/edit'
  end

  patch '/posts/:id' do
    # get input from user via params to update db
  end

  delete '/posts/:id/delete' do
    # @post.delete
    # redirect to '/posts'
  end

end
