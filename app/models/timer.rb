class Timer < ActiveRecord::Base
  belongs_to :group
  attr_accessible :deadline,:content
end
