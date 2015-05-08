
get '/' do

  # redirect '/home/sign_up'
  erb :index
end

# /home/all
get '/home' do
  @creator = Creator.all

  erb :login_form
end

#new = /home
get '/home/sign_up' do
  @creator = Creator.new

  erb :new_creator_form
end

# create
post '/home' do
@creator = @creator = Creator.new(name: params[:name], email: params[:email], password_hash: params[:password_hash])
    @creator.password = params[:password_hash]
    @creator.save!
#  if @creator.save
#     status 200
#     erb :creator_show_form
#   else
#     status 404
#     erb :new_creator_form
#   end
 end

# /home/sign-in aka /login
get '/home/:id' do

  @creator = Creator.find_by_email(params[:email])
    if @creator.password == params[:password_hash]
      give_token
    else
      redirect_to home_url
    end

  # @creator = Creator.where(id: params[:id]).first

  # if @creator
  #   erb :creator_show_form
  # else
  #   status 404
  #   "Try Again!!"
  # end
end

#edit/update
get '/home/:id/edit' do

  erb :edit_creator_form
end

put '/home/:id' do

end


