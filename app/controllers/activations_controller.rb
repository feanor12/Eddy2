class ActivationsController < ApplicationController
  before_filter :load_user_using_perishable_token
  before_filter :require_no_user

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
