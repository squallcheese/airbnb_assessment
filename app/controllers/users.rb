#Registering a new user
get '/register' do
  erb :register
end

post '/register' do

  @username = params[:username]
  @email = params[:email]
  @password = params[:password]

#Future: To do Register prompt errors, ie. "Email has been registered",etc...
#User is able to register with blank fields, how to check?
#Validation for username(unique), email(format) and password strength
  if User.check_duplicate(@email) == false #cheated, to check functionality
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

#Future: To do Sign in prompt errors, ie. "Password error",etc...
  if User.authenticate(@email, @password)
    @user = User.find_by email: @email
    session[:user_id] = @user.id
    redirect to '/user_page'
  else
    redirect to '/'
  end
end

get '/logout' do
  session.clear
  redirect to '/'
end