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

  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @group = @lecture.groups.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:lecture_id])
    @group = @lecture.groups.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to edit_lecture_path(@lecture)
    else
      render :action=> edit
    end
  end

  def destroy
    @lecture=Lecture.find(params[:lecture_id])
    @group=@lecture.groups.find(params[:id])
    @group.destroy
    redirect_to edit_lecture_path(@lecture)
  end

end
