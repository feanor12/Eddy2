class User < ActiveRecord::Base
  acts_as_authentic 
  validates_format_of :email, :with=> /.+@student\.tugraz\.at/
  attr_accessible :email, :password, :password_confirmation
  belongs_to :role
  has_many :comments
  has_many :posts
  has_many :lectures
  has_many :mylinks

  def activate!
    self.active = true
    save
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.activation_instructions(self).deliver
  end

  def deliver_welcome!
    reset_perishable_token!
    Notifier.welcome(self).deliver
  end

  def admin?
    role_symbols.include?(:admin)
  end

  def role_symbols
    [self.role.name.to_sym]
  end
end
