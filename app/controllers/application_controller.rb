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

  def load_sidebar
    if current_user
      @mylinks = current_user.mylinks
      @downloads = Download.find(:all,:order=>'updated_at DESC',:limit=>5)
      @announcements = Announcement.find(:all,:order=>'updated_at DESC',:limit=>5)
    end
  end

end
