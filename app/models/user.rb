class User < ActiveRecord::Base
  
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
