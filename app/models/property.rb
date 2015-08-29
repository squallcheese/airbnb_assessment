class Property < ActiveRecord::Base

  has_many :property_tags
  has_many :tags, through: :property_tags
  belongs_to :user

def self.list_user_property(user_id)
@properties = Property.where(user_id: user_id)
end

end