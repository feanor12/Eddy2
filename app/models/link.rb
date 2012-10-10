class Link < ActiveRecord::Base
  attr_accessible :name, :url, :public
  validates_format_of :url, :with=> /http:\/\/.+/
  validates_presence_of :name
  validates_presence_of :lecture
  belongs_to :lecture
  belongs_to :user
end
