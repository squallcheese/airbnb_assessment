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

post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

# get '/user_page' do
#   if session[:user_id]
#     @user = User.find(session[:user_id])
#     erb :user_page
#   else
#     redirect to '/sign_in'
#   end
# end