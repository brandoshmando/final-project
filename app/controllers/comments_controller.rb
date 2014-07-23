class CommentsController < ApplicationController
  def create
    @comment = @category.build(comment_params)
  end

  def update
  end

  def destroy
  end
end
