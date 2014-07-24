class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
  end

  def update
    @category = Category.find(params[:id])
  end

  def destroy
  end
end
