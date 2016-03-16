require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  # enable sessions
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'yaaaaaaas_queeeeeeeeeeen'
    register Sinatra::Flash
  end

  # Homepage
  get '/' do
    erb :index
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

end