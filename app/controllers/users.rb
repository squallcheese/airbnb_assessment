#Registering a new user
get '/register' do
  erb :register
end

post '/register' do

  @username = params[:username]
  @email = params[:email]
  @password = params[:password]

  if User.check_duplicate(@email) == false
    redirect to '/register'
  else
    @user = User.create(username: @username, email: @email, password: @password)
    erb :index
  end
end

#Logging in for existing user
get '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  @email = params[:email]
  @password = params[:password]

  if User.authenticate(@email, @password)
    @user = User.find_by email: @email
    session[:user_id] = @user.id
    erb :user_page
  else
    redirect to '/'
  end
end

#Logging out
post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

