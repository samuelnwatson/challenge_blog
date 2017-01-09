class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    @comment.poster = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to @article
    else
      flash[:alert] = "Comment has not been created."
      redirect_to @article
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
