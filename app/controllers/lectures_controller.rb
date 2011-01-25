class LecturesController < ApplicationController
  filter_resource_access
  filter_access_to :parse
  before_filter :store_location,:only=>[:show,:index]

  def new
    @lecture=Lecture.new
  end

  def parse
    @lecture = Lecture.find(params[:lecture_id])
    @lecture.parse!
    redirect_to edit_lecture_path(@lecture)
  end

  def create
    @lecture=Lecture.new(params[:lecture])
    @lecture.user = current_user
    if @lecture.save
      flash[:notice]="Successfully created Lecture"
      redirect_to lecture_path(@lecture)
    else
      render :action=>'new'
    end
  end

  def index
    @lectures=Lecture.find(:all,:include=>[:downloads],:order=>"name ASC")
    @lectures=@lectures.group_by(&:semester)
  end

  def show
    @lecture=Lecture.find(params[:id])
    @downloads=@lecture.downloads
    @announcements = @lecture.announcements.paginate(:page=>params[:page],:per_page=>3,:order=>"updated_at DESC")
    #@links = @lecture.links.with_permissions_to(:read)
    @links = @lecture.links.all
    if current_user
      @groups = @lecture.groups.all-current_user.groups.all
    end
    respond_to do |format|
      format.html
      format.meta4
    end
  end

  def edit
    @lecture=Lecture.find(params[:id])
  end

  def update
    @lecture=Lecture.find(params[:id])
    if @lecture.update_attributes(params[:lecture])
      redirect_to lectures_path
    else
      render :action=>"edit"
    end
  end

  def destroy
    @lecture=Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_path
  end
end
