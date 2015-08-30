#Listing all available properties
get '/user_page' do
  @properties = Property.all
  erb :user_page
end

#User's property page, for Viewing and Deleting
#Do not know why Sinatra only directs to /Delete, unless it's a built in feature of CRUD
get 'user_page/view' do
  @properties = Property.find_by_id(params[:id])
  current_user
  erb :user_page_view
end

post '/user_page/delete' do
  @property = Property.find_by_id(params[:id])
  Property.destroy(@property)
  erb :user_page_delete
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
@property_new.save
@current_user.properties << @property_new
erb :user_page_new

#redirect to '/user_page'
end

#Editing and Deleting property post
get '/user_page/edit' do
  current_user
  @property = Property.find_by_id(params[:id])
  erb :user_page_edit
end

post '/user_page/edit' do
  current_user
  @property = Property.find_by_id(params[:id])
  @property.property_name = params[:property_name]
  @property.property_type = params[:property_type]
  @property.room_type = params[:room_type]
  @property.location = params[:location]
  @property.pax = params[:pax]
  @property.price = params[:price]
  @property.rating = params[:rating]
  @property.property_text = params[:property_text]
  #@tags = params[:tag_text]

#   #old_tag = PropertyTag.where(property_id: params[:id])
#   #old_tag.each {|tag| tag.delete}

#   #new_tag.each_key do |tag|
#   #  @tag.Tag.find_by tag_text: tag
#   #  @tag.properties << current_property


  @property.save
  erb :user_page_edit
end

#   redirect to '/user_page/#{@property.id}'
#   end


