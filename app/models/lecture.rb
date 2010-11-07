class Lecture < ActiveRecord::Base
  has_many :downloads,:dependent=>:destroy
  has_many :announcements,:dependent=>:destroy
  has_many :links,:dependent=>:destroy

  has_many :groups
  
  belongs_to :user

  validates_numericality_of :semester, :integer_only=>true
  validates_format_of :unilink, :with=> /https:\/\/online\.uni-graz\.at\/.+/,:allow_blank=>true
  validates_format_of :tuglink, :with=> /https:\/\/online\.tugraz\.at\/.+/,:allow_blank=>true

  attr_accessible :name,:semester,:description,:tuglink,:unilink
end
