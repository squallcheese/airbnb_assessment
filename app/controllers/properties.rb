get '/user_page' do
  @properties = Property.all
  erb :user_page
end

get '/user_page/:id' do
  @properties = Property.find(params[:id])
  erb :property
end

post '/user_page/new' do
  property_type = params[:property_type]
  room_type = params[:room_type]
  location = params[:location]
  pax = params[:pax]
  price = params[:price]
  rating = params[:rating]
  property_text = params[:property_text]
  tags = params[:tag_text]
end
# @property = Property.new(property_type: property_type, room_type: room_type, location: location, pax: pax, price: price, rating: rating, property_text: property_text)

# tags.each_key do |tag|
#   @tag = Tag.find_by tag_text: tag
#   @tag.properties << @property
# end

# @property.save

# redirect to '/user_page/#{@property.id}'
# end

# get '/user_page/:id' do
#   @property = Property.find(params[:id])
#   erb :user_page
# end

# get '/user_page/:id/edit' do
#   @property = Property.find(params[:id])
#   erb :edit
# end

# post '/user_page/:id/delete' do
#   @property = Property.find(params[:id])
#   Property.delete(@property)

# redirect to '/user_page'
# end

# post '/post/:id/save' do
#   property_type = params[:property_type]
#   room_type = params[:room_type]
#   location = params[:location]
#   pax = params[:pax]
#   price = params[:price]
#   rating = params[:rating]
#   property_text = params[:property_text]
#   tags = params[:tag_text]

#   current_property = Property.find(params[:id])
#   current_property[:property_type] = property_type
#   current_property[:room_type] = room_type
#   current_property[:location] = location
#   current_property[:pax] = pax
#   current_property[:price] = price
#   current_property[:rating] = rating
#   current_property[:property_text] = rating

#   old_tag = PropertyTag.where(property_id: params[:id])
#   old_tag.each {|tag| tag.delete}

#   new_tag.each_key do |tag|
#     @tag.Tag.find_by tag_text: tag
#     @tag.properties << current_property
#   end

#   current_property.save

#   redirect to '/user_page/#{@property.id}'
#   end

#  post '/logout' do
#   session[:user_id] = nil
#   redirect to '/'
# end