class LecturesController < ApplicationController
filter_resource_access
  def new
    @lecture=Lecture.new
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
  end

  def show
    @lecture=Lecture.find(params[:id])
    @downloads=@lecture.downloads
    @announcements = @lecture.announcements.paginate(:page=>params[:page],:per_page=>5)
    respond_to do |format|
      format.html
      format.xml{render :content_type=>"application/metalink+xml"}
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
