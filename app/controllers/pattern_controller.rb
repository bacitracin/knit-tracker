class PatternController < ApplicationController

  # CREATE
  get '/patterns/new' do #take you to the new pattern
  end

  post '/patterns' do
    if is_logged_in?
      @patterns = Pattern.all
      erb :'/patterns/index'
    else
    end
  end

  # READ
  get '/patterns' do
  end

  get '/patterns/:id' do
  end

  # UPDATE
  get '/patterns/:id/edit' do
  end

  post '/patterns/:id' do
  end

  # DELETE
  post '/tweets/:id/delete' do
  end

end