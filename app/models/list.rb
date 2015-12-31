class List < ActiveRecord::Base
  belongs_to :user

  scope :all_public, -> {where(:private => false)}
end
