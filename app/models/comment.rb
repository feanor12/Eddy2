class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :commentable, :polymorphic=>true
  belongs_to :user

  validates_presence_of :body, :user, :commentable

  def set_current_user
    user=current_user
  end
end
