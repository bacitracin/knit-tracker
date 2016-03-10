class UserController < ApplicationController

  # SIGN UP
  get '/signup' do
    if is_logged_in?
      flash[:notice] = "You were already logged in. Here are your patterns."
      redirect to '/patterns'
    else
      erb :'user/create_user'
    end
  end

  ### POST SIGN UP
  post '/signup' do
    if is_logged_in?
      flash[:notice] = "You were already logged in. Here are your patterns."
      redirect to '/patterns'
    elsif params[:username] == "" || params[:password] == ""
      flash[:notice] = "In order to sign up for account, you must have both a username & a password. Please try again."
      redirect to '/signup'
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
      flash[:notice] = "You were already logged in. Here are your patterns."
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
      flash[:notice] = "Oops something was not right. Please try again."
      redirect "/login"
    end
  end

  # USER LOGOUT
  get '/logout' do
    if is_logged_in?
      session.clear
      flash[:notice] = "You have been logged out of your account."
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