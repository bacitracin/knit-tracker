class PatternController < ApplicationController

  # CREATE
  get '/patterns/new' do #take you to the add new pattern page
    if is_logged_in?
      erb :'patterns/add_pattern'
    else
      flash[:notice] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  post '/patterns' do
    if params[:pattern_name] == "" || params[:pattern_category] == "" || params[:pattern_url] == "" #must have name, category & URL
      flash[:notice] = "Oops! Patterns must have a name, category and URL. Please try again."
      redirect to '/patterns/new' ### add in description of error
    else
      user = User.find_by_id(session[:user_id])
      @pattern = Pattern.create(
        :pattern_name => params[:pattern_name],
        :pattern_category => params[:pattern_category],
        :free_pattern => params[:free_pattern],
        :pattern_url => params[:pattern_url],
        :suggested_yarn => params[:suggested_yarn],
        :yarn_weight => params[:yarn_weight],
        :needle_size => params[:needle_size],
        :yardage => params[:yardage],
        :pattern_notes => params[:pattern_notes],
        :user_id => user.id)
      redirect to "/patterns/#{@pattern.id}"
    end
  end

  # READ

  get '/patterns' do
    if is_logged_in?
      @user = current_user
      @patterns = @user.patterns.all
      erb :'patterns/index'
    else
      flash[:notice] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  get '/patterns/:id' do
    if is_logged_in?
      @pattern = Pattern.find_by_id(params[:id])
      erb :'patterns/show'
    else
      flash[:notice] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  # UPDATE
  get '/patterns/:id/edit' do
    if is_logged_in?
      @pattern = Pattern.find_by_id(params[:id])
      if @pattern.user_id == session[:user_id]
        erb :'patterns/edit_pattern'
      else
        flash[:notice] = "Sorry that's not your pattern. You can't edit it."
        redirect to '/patterns'
      end
    else
      flash[:notice] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  post '/patterns/:id' do
    if params[:pattern_name] == "" || params[:pattern_category] == "" || params[:pattern_url] == "" #must have name, category & URL
      flash[:notice] = "Oops! Patterns must have a name, category and URL. Please try again."
      redirect to "/patterns/#{params[:id]}/edit" ### add in description of error
    else
      @pattern = Pattern.find_by_id(params[:id])
      @pattern.pattern_name = params[:pattern_name]
      @pattern.pattern_category = params[:pattern_category]
      @pattern.free_pattern = params[:free_pattern] || "N/A"
      @pattern.pattern_url = params[:pattern_url]
      @pattern.suggested_yarn = params[:suggested_yarn] || "N/A"
      @pattern.yarn_weight = params[:yarn_weight] || "N/A"
      @pattern.needle_size = params[:needle_size] || "N/A"
      @pattern.yardage = params[:yardage] || "N/A"
      @pattern.pattern_notes = params[:pattern_notes] || "N/A"
      @pattern.user_id = current_user.id
      @pattern.save
      flash[:notice] = "Your pattern has been updated!"
      redirect to "/patterns/#{@pattern.id}"
    end
  end

  # DELETE
  post '/patterns/:id/delete' do
    if is_logged_in?
      @pattern = Pattern.find_by_id(params[:id])
      if @pattern.user_id == session[:user_id]
        @pattern.delete
        flash[:notice] = "The pattern was deleted."
        redirect to '/patterns'
      end
      else
      flash[:notice] = "Looks like you weren't logged in yet. Please log in below."
      redirect to '/login'
    end
  end

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
  end

end