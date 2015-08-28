class Tag < ActiveRecord::Base

  has_many :propertytags
  has_many : :propertys, through: :propertytags

end