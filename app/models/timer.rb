class Timer < ActiveRecord::Base
  belongs_to :group
  attr_accessible :deadline,:content,:link
  validates_format_of :link, :with=> /http:\/\/.+/
end
