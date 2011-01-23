class GroupApplicationsController < ApplicationController
  filter_access_to :create,:destroy
  def create
    @group=Group.find(params[:group_id])
    @lecture=@group.lecture
    gas=current_user.group_applications.where(:group_id=>@lecture.groups)
    gas.each {|ga| ga.destroy}
    @application=GroupApplication.new
    @application.group=@group
    @application.user=current_user
    @application.save
    redirect_to @lecture
  end

  def destroy
    @application = current_user.group_applications.where(:group_id=>params[:group_id])
    @application.first.destroy
    @group = Group.find(params[:group_id])
    redirect_to @group.lecture
  end

end
