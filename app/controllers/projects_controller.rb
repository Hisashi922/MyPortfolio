class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      flash[:notice] = 'You have created book successfully'
      #redirect_to book_path(@book.id)
      redirect_to project_path(@project.id)
    else
      @projects = Project.all
      @user = current_user
      render :index
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:project_name, :content)
  end
end
