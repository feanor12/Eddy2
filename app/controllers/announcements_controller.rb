class AnnouncementsController < ApplicationController
  filter_resource_access
  before_filter :store_location,:only=>[:show]
  def new
    @lecture = Lecture.find(params[:lecture_id])
    @announcement=@lecture.announcements.build
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @announcement = @lecture.announcements.build(params[:announcement])
    @announcement.user = current_user
    if @announcement.save
      redirect_to lecture_path(@lecture)
    else
      render :action=>"new"
    end
  end

  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @announcement = @lecture.announcements.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:lecture_id])
    @announcement = @lecture.announcements.find(params[:id])
    if @announcement.update_attributes(params[:announcement])
      redirect_to [@lecture,@announcement]
    else
      render :action=>"edit"
    end
  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @lecture.announcements.find(params[:id]).destroy()
    redirect_to @lecture
  end

  def show
    @comment = Comment.new
  end

end
