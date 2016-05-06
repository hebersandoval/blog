class PostsController < ApplicationController

  get '/posts' do
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @posts = Post.all
      erb :'posts/index'
    else
      redirect to '/login'
    end
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
