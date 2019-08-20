class PublishhousesController < ApplicationController
  before_action :load_publishhouse, only: %i(show)

  def show
    @books = @publishhouse.books
  end

  private

  def load_publishhouse
    @publishhouse = Publishhouse.find_by id: params[:id]

    return if @publishhouse
    flash[:none] = t "none"
    redirect_to root_path
  end
end
