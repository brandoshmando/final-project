class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end
end
