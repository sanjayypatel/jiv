class Item < ActiveRecord::Base
  belongs_to :user
  has_many :listings
  has_many :lists, :through => :listings
  ITEM_MEDIA_TYPES = ['Book', 'Movie', 'Show', 'Album', 'Game']

  scope :excluding, -> (items){ where.not(id: items) }

  def finished_on_to_s
    self.finished_on ? self.finished_on.to_formatted_s(:long) : ""
  end

end
