class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@binarylogic.com"
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

  def password_reset_confirmation(user)
    subject "Password Reset Confirmation"
    from "noreply@binarylogic"
    recipients user.email
    sent_on Time.now
    @root_url = root_url
  end

end
