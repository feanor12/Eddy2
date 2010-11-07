class GroupApplicationsController < ApplicationController
  filter_resource_access
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


end
