class User < ActiveRecord::Base
  has_many :items
  has_many :lists
  
  def self.create_with_omniauth(auth)
    user = User.new(
      provider: auth["provider"],
      uid: auth["uid"],
      name: auth["info"]["name"]
    )
    user.save!
    return user
  end
  
end
