class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
  end

  def update
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
