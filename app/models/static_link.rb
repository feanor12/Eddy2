class StaticLink < ActiveRecord::Base
  validates_format_of :url, :with=> /http:\/\/.+/
  validates_presence_of :url,:name 
end
