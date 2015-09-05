get '/tags' do
  @properties = []
  session[:tags].each do |tag|
  @tag = Tag.find_by tag_text: tag_text
  @tag.properties.each do |property|
  @properties << property
  end
end
erb :index
end

post '/tags' do
  arr_tags = []
  tags = params[:tags]
  tags.each do |tag|
  arr_tags << tag
end
  session[:tags] = arr_tags
  redirect to('/tags')
end