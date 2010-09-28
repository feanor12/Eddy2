class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_sidebar
  layout 'application'
  helper_method :current_user_session, :current_user

  protected
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session=UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user=current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def load_sidebar
    if current_user
      @mylinks = current_user.mylinks
      @s_downloads = Download.find(:all,:order=>'updated_at DESC',:limit=>5)
      @s_announcements = Announcement.find(:all,:order=>'updated_at DESC',:limit=>5,:include=>:lecture)
    end
  end

  def permission_denied
    flash[:notice]="Something was in your way and you went back"
    redirect_to root_path
  end
end
