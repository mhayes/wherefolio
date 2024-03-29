class ProjectsController < ApplicationController
  before_filter :require_user!
  
  def index
    @projects = Project.in_account(current_account)
    @project  = Project.new
  end
  
  def create
    @project         = Project.new(params[:project])
    @project.account = current_account
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render action: :new
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    @photos  = @project.photos.ordered
  end
end