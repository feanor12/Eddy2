class AnnouncementsController < ApplicationController
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

end
