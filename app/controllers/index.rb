get '/' do
  erb :index
end

get '/home' do
  # @user = Creator.find(id: session[:id])
  erb :home
end

#create new form
# get "/surveys/new" do
get "/home/survey" do
  erb :create_survey
end

# CREATE
# post "/surveys" do
post '/home/survey' do
  @survey = Survey.create(
    title: params[:title],
    description: params[:description],
    creator_id: session[:id]
  )

  @question = Question.create(
    body: params[:body],
    survey_id: @survey.id
  )

  @choice_string = params[:answer]

  @choice_array = @choice_string.split(',')
  @choice_array.each do |choice|
    Choice.create(answer: choice, question_id: @question.id)
  end

  erb :display_survey
end

# get "/surveys/:id" do
get "/survey/:id" do
  @survey = Survey.find(params[:id])
  @question = @survey.questions.first
  @choices = @question.choices.answer
  # @choices.each do |choice|
  #   puts choice.answer
  # end
end


#displays all forms created
get "/home/all" do
  @surveys = Survey.all
  erb :view_all
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
    redirect '/'
  else
    status 401
    @login_error = "The Email or Password is wrong!!!"
    redirect '/login'
  end
end

get '/logout' do
  logout
  redirect to('/')
end
