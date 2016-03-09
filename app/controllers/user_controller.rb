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
      session[:user_id] = @user.id #logged in
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
  post "/login" do   
    @user = User.find_by(username: params[:username]) #find the user
    if @user && @user.authenticate(params[:password]) #check password matches
      session[:user_id] = @user.id   #log them in
      redirect "/patterns" #show them some tweets
    else
      redirect "/login"
    end
  end

  # USER LOGOUT
  get '/logout' do
    if is_logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

end