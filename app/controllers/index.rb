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

get '/home' do
  # @user = Creator.find(id: session[:id])

  erb :home
end

get "/home/form" do
  erb :create_survey
end

get "/home/all" do
  erb :view_all
end




