#Lists all user's properties
get '/user_page' do
  current_user
  @user = User.find_by id: session[:user_id]
  @properties = @user.properties
  erb :user_page
end

#Creating new property post
get '/user_page/new' do
  erb :user_page_new
end

post '/user_page/new' do
  current_user
  @property_name = params[:property_name]
  @property_type = params[:property_type]
  @room_type = params[:room_type]
  @location = params[:location]
  @pax = params[:pax]
  @price = params[:price]
  @rating = params[:rating]
  @property_text = params[:property_text]
  #@tags = params[:tag_text]

  @property_new = Property.new(property_name: @property_name,property_type: @property_type, room_type: @room_type, location: @location, pax: @pax, price: @price, rating: @rating, property_text: @property_text)

  # tags.each_key do |tag|
  #   @tag = Tag.find_by tag_text: tag
  #   @tag.properties << @property
  # end
  @current_user.properties << @property_new
  @property_new.save
  redirect to '/user_page'
end

#Editing and Deleting property post
get '/user_page/edit/:id' do
  current_user
  #redirect to '/user_page' if params[:id].nil?

  @property = Property.find(params[:id])
  erb :user_page_edit
end

post '/user_page/edit/:id' do
  current_user
  @property = Property.find(params[:id])
  @property.property_name = params[:property_name]
  @property.property_type = params[:property_type]
  @property.room_type = params[:room_type]
  @property.location = params[:location]
  @property.pax = params[:pax]
  @property.price = params[:price]
  @property.rating = params[:rating]
  @property.property_text = params[:property_text]
  #@tags = params[:tag_text]

  @property.save
#   #old_tag = PropertyTag.where(property_id: params[:id])
#   #old_tag.each {|tag| tag.delete}

#   #new_tag.each_key do |tag|
#   #  @tag.Tag.find_by tag_text: tag
#   #  @tag.properties << current_property

  redirect to '/user_page'
end

post '/user_page/delete/:id' do
  @property = Property.find(params[:id])
  @property.destroy
  redirect to '/user_page'
end
