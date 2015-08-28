get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  @email = params[:email]
  @password = params[:password]

  if User.authenticate(@email, @password)
    user = User.find_by email: @email
    session[:user_id] = user.id
    redirect to '/user_page'
  else
    redirect to '/'
  end
end

get '/register' do
  erb :register
end

post '/register' do
  p session[:email]

  @username = params[:username]
  @email = params[:email]
  @password = params[:password]

  if User.check_duplicate(@email) == false
    redirect to '/'
  else
    @user = User.create(username: @username, email: @email, password: @password)
    erb :user_page
  end
end

get '/user_page' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :user_page
  else
    redirect to '/sign_in'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end