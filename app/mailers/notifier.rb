class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  def activation_instructions(user)
    @account_activation_url = activate_url(user.perishable_token)
    mail(:subject => "Activation Instructions",
         :from => "noreply@binarylogic.com",
         :to => user.email)
  end

  def welcome(user)
    @root_url = root_url
    mail(:subject => "Welcome to the site!",
    :from => "noreply@binarylogic.com",
    :to => user.email)
  end

  def password_reset_instructions(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(:subject => "Password Reset Instructions",
    :from => "noreply@binarylogic",
    :to => user.email)
  end

  def password_reset_confirmation(user)
    @root_url = root_url
    mail(:subject => "Password Reset Confirmation",
    :from => "noreply@binarylogic",
    :to => user.email)
  end

end
