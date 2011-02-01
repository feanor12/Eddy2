class Group < ActiveRecord::Base
  has_many :timers,:dependent=>:destroy
  belongs_to :lecture 
  
  has_many :group_applications,:dependent=>:destroy
  has_many :users,:through=>:group_applications

  attr_accessible :name
end
