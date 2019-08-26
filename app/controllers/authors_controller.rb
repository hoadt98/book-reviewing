class AuthorsController < ApplicationController
  before_action :load_author, only: %i(show)

  def show
    @books = @author.books
  end

  private

  def load_author
    @author = Author.find_by id: params[:id]

    return if @author
    flash[:none] = t "none"
    redirect_to root_path
  end
end
