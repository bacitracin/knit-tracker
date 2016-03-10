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

end