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
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      erb :'posts/new'
    else
      redirect to '/login'
    end
  end

  post '/posts' do
    if params[:content] == ""
      redirect to '/posts/new'
    else
      User.find_by_id(session[:user_id])
      Post.create(content: params[:content], title: params[:title], user_id: @user.id)
      redirect to "/posts/#{@post.id}"
    end
  end

  get '/posts/:id' do # show action
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @post = Post.find_by_id(params[:id])
      erb :'posts/show'
    else
      redirect to '/login'
    end
  end

  get '/posts/:id/edit' do # update action
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    if @user == @post.user
      erb :'/posts/edit'
    elsif
      redirect to "/posts/#{@post.id}"
    else
      redirect to '/login'
    end
  end

  patch '/posts/:id' do
    if params[:content] == ""
      redirect to "/posts/#{params[:id]}/edit"
    else
      @post = Post.find_by_id(params[:id])
      @post.content = params[:content]
      @post.save
      redirect to "/posts/#{@post.id}"
    end
  end

  delete '/posts/:id/delete' do
    # @post.delete
    # redirect to '/posts'
  end

end
