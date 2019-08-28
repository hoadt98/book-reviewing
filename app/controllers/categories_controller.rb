class CategoriesController < ApplicationController
  before_action :load_category, only: %i(show)

  def show
    @books = @category.books
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]

    return if @category
    flash[:none] = t "none"
    redirect_to root_path
  end
end
