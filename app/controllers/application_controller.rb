require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'yaaaaaaaaaaaaaaaaaaaaas_queeeeeeeeeeen'
  end

  get '/' do
    "Welcome to the knitting tracker"
  end
end