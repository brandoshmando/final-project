class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
  end
end
