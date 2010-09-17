class Lecture < ActiveRecord::Base
  has_many :downloads,:dependent=>:destroy
  has_many :announcements,:dependent=>:destroy
  belongs_to :user
end
