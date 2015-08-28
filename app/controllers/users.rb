get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/sign_in' do
  erb :sign_in
end

get '/register' do
  erb :register
end

post '/register' do

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