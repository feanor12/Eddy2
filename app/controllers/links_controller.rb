class LinksController < ApplicationController

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @link = @lecture.links.new
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @link=@lecture.links.build(params[:link])
    if @link.save
      redirect_to [@link.lecture]
    else
      render :action=>:new
    end
  end

  def edit
    @lecture=Lecture.find(params[:lecture_id])
    @link = @lecture.links.find(params[:id])
  end

  def update
    @lecture=Lecture.find(params[:lecture_id])
    @link = @lecture.links.find(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to [@lecture]
    else
      render :action=>:edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @link = @lecture.links.find(params[:id])
    @link.destroy
    redirect_to [@lecture]
  end

end
