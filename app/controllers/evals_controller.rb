class EvalsController < ApplicationController
  # before_action :load_current_user, only: [:create, :edit]

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
    ap eval_params

    @eval = Eval.new(eval_params)
    if @eval.save
      render action: :edit
    else
      render action: :new
    end
  end

  def edit
    @eval = Eval.find(params[:id])
    if @eval.save
      render action: :edit
    else
      render action: :new
    end
  end

  def update
    @eval = Eval.find(params[:id])
    @eval.update(eval_params)
    redirect_to @eval
  end

private
  def eval_params
    params.require(:eval).permit(:title, :template, categories_attributes: [:title, :max_score, :id], comments_attributes: [:description, :id])
  end
end
