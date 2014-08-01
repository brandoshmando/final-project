class EvalsController < ApplicationController
  # load_and_authorize_resource

  #do we need this?
  def index

  end
  #do we need this?
  def show
    @eval = Eval.find(params[:id])
  end

  def new
    @eval = Eval.new
    @category = @eval.categories.build
    @comment = @category.comments.build
  end

  def create
    @eval = Eval.new(eval_params)
    @eval.professor = current_user
    if @eval.save
      redirect_to evals_url
    else
      render :new
    end
  end

  def edit
    @eval = Eval.find(params[:id])
  end

  def update
    @eval = Eval.find(params[:id])

    if @eval.update(eval_params)
      redirect_to eval_path(@eval)
    else
      render :edit
    end
  end

  def destroy
    @eval = Eval.find(params[:id])
    @eval.destroy
    redirect_to evals_url
  end

private
  def eval_params
    params.require(:eval).permit(:title, :template, :course_ids, categories_attributes: [:title, :max_score, :id, :_destroy, comments_attributes: [:description, :id, :_destroy]])
  end
end