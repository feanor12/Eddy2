class TimersController < ApplicationController

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @group = Group.find(params[:group_id])
    @timer=Timer.new
  end


  def create
    @lecture = Lecture.find(params[:lecture_id])
    @group = Group.find(params[:group_id])
    @timer=@group.timers.build(params[:timer])
    if @timer.save
      flash[:notice]="Tick Tack Tick Ta..."
      redirect_to edit_lecture_group_path(@lecture,@group)
    end
  end

  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @group = Group.find(params[:group_id])
    @timer=@group.timers.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:lecture_id])
    @group = Group.find(params[:group_id])
    @timer=@group.timers.find(params[:id])
    @timer.update_attributes(params[:timer])
    redirect_to edit_lecture_group_path(@lecture,@group)
  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @group = Group.find(params[:group_id])
    @timer=@group.timers.find(params[:id])
    @timer.destroy
    redirect_to edit_lecture_group_path(@lecture,@group)
  end
end
