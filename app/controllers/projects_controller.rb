class ProjectsController < ApplicationController
  before_action :vendor_variable, except: [:project_params]


  def show
    @project = @vendor.projects.find(params[:id])
  end

  def new
    @project = @vendor.projects.build
  end

  def create
    @project = @vendor.projects.build
    if @project.save
      flash[:success] = 'You created a new project'
      redirect_to root_path
    else
      flash[:danger] = 'Sorry, something went wrong =/'
      redirect_to new_vendor_project_path(@project)
    end
  end

  def edit
    @project = @vendor.projects.find([:id])
  end

  def update
    @project = @vendor.projects.find([:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'You updated your project'
      redirect_to root_path
    else
      flash[:danger] = 'Sorry, something went wrong'
      redirect_to edit_vendor_project_path(@project)
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :due_time)
  end

  def vendor_variable
    @vendor = Vendor.find(params[:vendor_id])
  end
end
