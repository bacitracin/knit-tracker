class PatternController < ApplicationController

  # CREATE
  get '/patterns/new' do #take you to the new pattern page
    if is_logged_in?
      erb :'patterns/add_project'
    else
      redirect to '/login'
    end
  end

  post '/patterns' do
    if params[:pattern_name] == "" || params[:pattern_category] == "" || params[:pattern_url] == ""
      redirect to '/patterns/new' ### add in description of error
      #needs a name, category, URL. everything else is fine
    else
      user = User.find_by_id(session[:id])
      @pattern = Pattern.create(
        :pattern_name => params[:pattern_name],
        :pattern_category => params[:pattern_category],
        :free => params[:free] || "N/A",
        :pattern_url => params[:pattern_url],
        :suggested_yarn => params[:suggested_yarn] || "N/A",
        :yarn_weight => params[:yarn_weight] || "N/A",
        :guage => params[:guage] || "N/A",
        :needle_size => params[:needle_size] || "N/A",
        :yardage => params[:yardage] || "N/A",
        :notes => paramsp[:notes] || "N/A")
    end
  end

  post '/tweets' do #takes params from the form
    if params[:content] == '' #no blank tweets allowed. descriptive error message would be nice
      redirect to 'tweets/new'
    else
      user = User.find_by_id(session[:user_id])
      @tweet = Tweet.create(content: params[:content], user_id: user.id) #make that tweet
      redirect to "/tweets/#{@tweet.id}" #dont use '' for string interpolation
    end
  end

  get '/patterns' do
    if is_logged_in?
      @patterns = Pattern.all
      erb :'/patterns/index'
    else
      redirect to '/login'
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

    def is_logged_in?
    !!session[:id]
  end

  def current_user
    @user = User.find(session[:id])
  end

end