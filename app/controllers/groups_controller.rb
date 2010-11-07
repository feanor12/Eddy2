class GroupsController < ApplicationController
  filter_resource_access
  def new
    @lecture = Lecture.find(params[:lecture_id])
    @group=Group.new
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @group = @lecture.groups.build(params[:group])
    if @group.save
      flash[:notice]="Group created"
      redirect_to @lecture
    end
  end

end
