class UserController < ApplicationController

  # SIGN UP
  get '/signup' do
    if is_logged_in?
      redirect to '/patterns'
    else
      erb :'user/create_user'
    end
  end

  ### POST SIGN UP
  post '/signup' do
    if is_logged_in?
      redirect to '/patterns'
    elsif params[:username] == "" || params[:password] == ""
      redirect to '/signup' #add some sort of explicit message
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:id] = @user.id #logged in
      redirect to '/patterns'
    end
  end

  # LOG IN
  get '/login' do #renders the log in page
    if is_logged_in?
      redirect '/patterns'
    else
      erb :'user/login'
    end
  end

  ### POST LOGIN

  # USER LOGOUT
  get '/logout' do
    if is_logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  # HELPERS
  def is_logged_in?
    !!session[:id]
  end

  def current_user
    User.find(session[:id])
  end

end