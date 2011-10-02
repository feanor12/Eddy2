class UserSessionsController < ApplicationController
  filter_resource_access
  def new
    @user_session = UserSession.new
  end

  def create
    if User.find_by_email(params[:user_session][:email])
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Login successful!"
        redirect_back_or_default(posts_path)
      else
        redirect_to posts_path
      end
    else
      redirect_to new_user_path
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to root_path
  end
end
