class PostsController < ApplicationController

  # routes match the web request sent by the client to some code in our application that tells the app what data and templates to send back to the client.
  get '/posts' do # index action
    if logged_in? # session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @posts = Post.all
      erb :'posts/index'
    else
      redirect to '/login', locals: {message: "Please login or create an account."}
    end
  end

  get '/posts/new' do # create action
    if logged_in? # session[:user_id]
      @user = User.find_by_id(session[:user_id])
      erb :'posts/new'
    else
      redirect to '/login', locals: {message: "Please login or create an account."}
    end
  end

  post '/posts' do # create action
    if params[:content] == ""
      redirect to '/posts/new', locals: {message: "Please fill in the Content."}
    else
      @user = User.find_by_id(session[:user_id])
      @post = Post.create(content: params[:content], title: params[:title], user_id: @user.id)
      redirect to "/posts/#{@post.id}", locals: {message: "Post successfully saved!"}
    end
  end

  get '/posts/:id' do # show action
    if logged_in? # session[:user_id]
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
    if logged_in? # session[:user_id]
      if @user == @post.user
        erb :'/posts/edit'
      else
        redirect "/posts/#{@post.id}"
      end
    else
      redirect '/login'
    end
  end

  patch '/posts/:id' do # update action
    if params[:content] == ""
      redirect to "/posts/#{params[:id]}/edit"
    else
      @post = Post.find_by_id(params[:id])
      @post.content = params[:content]
      @post.save
      redirect to "/posts/#{@post.id}", locals: {message: "Post successfully updated."}
    end
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @user = User.find_by_id(session[:user_id])
    if @user == @post.user
      @post.delete
      redirect to '/posts', locals: {message: "Post successfully deleted."}
    else
      redirect to "/posts/#{params[:id]}"
    end
  end

end
