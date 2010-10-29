class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture
  has_many :comments,:as=>:commentable,:dependent=>:destroy
  attr_accessible :title, :body 
end
