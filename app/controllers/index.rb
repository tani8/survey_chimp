get '/' do

  redirect '/'
end

# get '/creator' do
#   @creator = Creator.all

#   erb :index
# end

# #new
# get '/creator/new' do
#   @creator = Creator.new

#   erb :new_survey_form
# end

# #create
# post '/creator' do
#   @creator = Creator.new(name: params[:name])

# end

#homepage with creating or viewing options
get '/home' do
  # @user = Creator.find(id: session[:id])

  erb :home
end

#create new form
get "/home/survey" do
  erb :create_survey
end

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
   # erb :create_survey
   # redirect '/home/display_survey'
  erb :display_survey
end

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






