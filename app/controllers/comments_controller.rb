class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])
    #@comment = current_user.comments.new(comment_params)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.project_id = @project.id
    if @comment.save
      #flash[:notice] = 'You have created book successfully'
      #redirect_to book_path(@book.id)
      redirect_to project_path(@project.id)
    else
      @projects = Project.all
      @user = current_user
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
