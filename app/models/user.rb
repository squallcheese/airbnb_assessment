class User < ActiveRecord::Base
  has_many :properties

  def self.check_duplicate(email)
    duplicate = self.find_by email: email
    if duplicate == nil
      true
    else
      false
    end
  end

  def self.authenticate(email, password)
    check = self.find_by email: email, password: password
    if check == nil
      false
    else
      true
    end
  end

end