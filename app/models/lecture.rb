class Lecture < ActiveRecord::Base
  has_many :downloads,:dependent=>:destroy
  has_many :announcements,:dependent=>:destroy
  has_many :links,:dependent=>:destroy
  belongs_to :user

  validates_numericality_of :semester, :integer_only=>true
end
