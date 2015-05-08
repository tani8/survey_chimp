get '/' do

  redirect '/creator'
end

get '/creator' do
  @creator = Creator.all

  erb :index
end

#new
get '/creator/new' do
  @creator = Creator.new

  erb :new_survey_form
end

#create
post '/creator' do
  @creator = Creator.new(name: params[:name])

end

