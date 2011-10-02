class ActivationsController < ApplicationController
  filter_access_to :create,:resend_activation,:new
  before_filter :load_user_using_perishable_token,:only=>['create']

  def new

  end

  def resend_activation
    @user=User.where(:mail=>params[:email],:active=>false)
    if @user
      flash[:notice]="Email with activation code was send to you"
      @user.deliver_activation_instructions!
      redirect_to root_path
    end
  end

  def create
    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false)
      @user.deliver_welcome!
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to root_url
  end

  private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)
    unless @user
      flash[:notice]="We,re sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
end
