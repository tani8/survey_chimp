# renders the index page
get '/' do
  erb :index
end

# renders login page
get '/login' do
  erb :login_form
end

# renders sign-up page
get '/sign_up' do
  @creator = Creator.new

  erb :new_creator_form
end

# sign-in page
post '/sign_up' do
    @creator = Creator.new(name: params[:name], email: params[:email], password_hash: params[:password_hash])
    @creator.password = params[:password_hash]

   if @creator.save
      status 200
      erb :creator_show_form
      # add redirect to the /home route
    else
      status 404
      erb :new_creator_form
    end
 end

# login page
post '/login' do
  @creator = Creator.find_by_email(params[:login])

  if @creator && @creator.password == params[:password]
    login(@creator)
    redirect '/home'
  else
    status 401
    @login_error = "The Email or Password is wrong!!!"
    redirect '/login'
  end
end


