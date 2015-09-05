#if database is all empty, first time launch index page, how to pass?
get '/' do
  @property = Property.all
  #redirect to '/' if @property.nil?
  erb :index
end

#if property database for user is all empty, how to pass?
post '/user_page' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
#  elsif
#    @property.nil? redirect to '/user_page'
  else
    redirect to '/sign_in'
  end
end