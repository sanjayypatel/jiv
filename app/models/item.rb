class Item < ActiveRecord::Base
  ITEM_MEDIA_TYPES = ['Book', 'Movie', 'Show', 'Album', 'Game']

  def finished_on_to_s
    self.finished_on ? self.finished_on.to_formatted_s(:long) : ""
  end
end
