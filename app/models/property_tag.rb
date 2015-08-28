class PropertyTag < ActiveRecord::Base

  belongs_to :propertys
  belongs_to :tags
  belongs_to :users

end