get '/user_page' do
  @propertys = Property.all
  erb :user_page
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

@property = Property.new(property_type: property_type, room_type: room_type, location: location, pax: pax, price: price, rating: rating, property_text: property_text)

tags.each_key do |tag|
@tag = Tag.find_by tag_text: tag
@tag.propertys << @property
end

#stopped here
