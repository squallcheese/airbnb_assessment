class Property < ActiveRecord::Base

  has_many :property_tags
  has_many :tags, through: :property_tags
  belongs_to :user

end