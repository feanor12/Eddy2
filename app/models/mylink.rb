class Mylink < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :user
  validates_format_of :url, :with=> /http:\/\/.+/ 

  belongs_to :user
end
