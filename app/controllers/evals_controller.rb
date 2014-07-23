class EvalsController < ApplicationController
  before_action :load_current_user, only: [:create, :edit]

  def index

  end

  def show
    @eval = Eval.find(params[:id])
  end

  def new
    @eval = Eval.new
  end

  def create
    @eval = Eval.new(eval_params)
    @eval.user_id = user_id
    if @eval.save
      redirect_to @eval
    else
      render action: :new
    end
  end

  def edit
    @eval = Eval.find(params[:id])
  end

private
  def eval_params
    params.require(:eval).permit(:title, :template)
  end
end
