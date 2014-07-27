class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to evals_url
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to evals_url
  end
end
