class Link < ActiveRecord::Base
  belongs_to :download
  validates_format_of :url, :with=> /http:\/\/.+/
end
