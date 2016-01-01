class List < ActiveRecord::Base
  belongs_to :user
  has_many :listings
  has_many :items, :through => :listings
  scope :all_public, -> {where(:private => false)}
end
