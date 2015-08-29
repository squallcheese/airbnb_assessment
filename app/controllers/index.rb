get '/' do
  @properties = Property.all
  erb :index
end

post '/user_page' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
  else
    redirect to '/sign_in'
  end
end

get '/user_page' do
  @current_user = User.find(session[:user_id])
  @properties = Property.user_property_list(session[:user_id])
  erb :user_page
end