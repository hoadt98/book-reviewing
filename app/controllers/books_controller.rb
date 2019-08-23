class BooksController < ApplicationController
  before_action :load_book, only: %i(show)

  def show; end

  def index
    @books = Book.book_order
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:none] = t "none"
    redirect_to root_path
  end
end
