class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_sidebar
  layout 'application'
  helper_method :current_user_session, :current_user, :redirect_back_or_default,:store_location

  protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session=UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user=current_user_session && current_user_session.user
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = false
  end

  def load_sidebar
    if current_user
      @mylinks = current_user.mylinks
      groups=current_user.groups
      @s_timers = Timer.joins(:group).where(:group_id=>groups).where('deadline > ?',Time.now).order('deadline ASC').limit(5)
    end
      @s_downloads = Download.find(:all,:order=>'updated_at DESC',:limit=>5)
      @s_announcements = Announcement.find(:all,:order=>'updated_at DESC',:limit=>5)
  end

  def permission_denied
    flash[:notice]="Something was in your way and you went back"
    redirect_to root_path
  end
end
