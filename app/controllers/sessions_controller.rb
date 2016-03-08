class SessionsController < ApplicationController

  get '/login' do
    erb: 'sessions/login.html'
  end

end