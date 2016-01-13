class List < ActiveRecord::Base
  belongs_to :user
  has_many :listings
  has_many :items, :through => :listings
  scope :all_public, -> {where(:private => false)}
  scope :public_or_owned, -> (user) {where("private = 0 OR user_id = ?", user.id)}
end
