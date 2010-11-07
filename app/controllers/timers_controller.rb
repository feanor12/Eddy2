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
      redirect_to @lecture
    end
  end
end
