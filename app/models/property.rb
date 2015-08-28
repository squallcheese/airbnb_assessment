class Property < ActiveRecord::Base

  has_many :propertytags
  has_many :tags, through: :propertytags

end