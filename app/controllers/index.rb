get '/' do
  @property = Property.all
  redirect to '/' if @property.nil?
  erb :index
end

post '/user_page' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
  elsif
    @property.nil? redirect to '/user_page'
  else
    redirect to '/sign_in'
  end
end