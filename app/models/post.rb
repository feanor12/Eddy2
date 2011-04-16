class Post < ActiveRecord::Base
  has_many :comments,:as=>:commentable,:dependent=>:destroy
  belongs_to :user
  validates_presence_of :title, :body, :user
  paginates_per 5
end
