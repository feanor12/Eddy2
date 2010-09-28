class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@binarylogic.com" # Removed name/brackets around 'from' to resolve "555 5.5.2 Syntax error." as of Rails 2.3.3
    recipients    user.email
    sent_on       Time.now
    @account_activation_url = activate_url(user.perishable_token)
  end

  def welcome(user)
    subject       "Welcome to the site!"
    from          "noreply@binarylogic.com"
    recipients    user.email
    sent_on       Time.now
    @root_url = root_url
  end

  def password_reset_instructions(user)
    subject "Password Reset Instructions"
    from "noreply@binarylogic"
    recipients user.email
    sent_on Time.now
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
  end

end
