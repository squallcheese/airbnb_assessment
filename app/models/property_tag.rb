class PropertyTag < ActiveRecord::Base

  belongs_to :properties
  belongs_to :tags

end