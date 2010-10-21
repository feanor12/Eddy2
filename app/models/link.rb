class Link < ActiveRecord::Base
  validates_format_of :url, :with=> /http:\/\/.+/
  validates_presence_of :name
  validates_presence_of :lecture
  belongs_to :lecture
end
