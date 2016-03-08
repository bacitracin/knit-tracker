class UserController < ApplicationController

  # SIGN UP
  get '/signup' do
    if is_logged_in?
      redirect to '/patterns'
    else
      erb :'users/create_user'
    end
  end
  
  ### POST SIGN UP

  # LOG IN
  get '/login' do #renders the log in page
    if is_logged_in?
      redirect '/patterns'
    else
      erb :create_user
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