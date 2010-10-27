class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.login_field = 'email'
  end
  validates_format_of :email, :with=> /.+@(student\.tugraz|edu\.uni-graz)\.at/
  validates_presence_of :login, :email, :role
  validates_uniqueness_of :login, :email

  attr_accessible :login,:email,:password, :password_confirmation

  belongs_to :role
  has_many :comments
  has_many :posts
  has_many :lectures
  has_many :mylinks
  has_many :announcements
  has_many :links
  has_many :downloads

  def activate!
    self.active = true
    save
  end

  def deactivate!
    self.active = false
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

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.password_reset_instructions(self).deliver
  end

  def deliver_password_reset_confirmation!
    reset_perishable_token!
    Notifier.password_reset_confirmation(self).deliver
  end

  def admin?
    role_symbols.include?(:admin)
  end

  def role_symbols
    [self.role.name.to_sym]
  end

end
