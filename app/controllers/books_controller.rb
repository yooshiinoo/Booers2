class BooksController < ApplicationController
  def index
     @book = Book.new
     @books = Book.page(params[:page])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
  end

  private

  def post_image_params
    params.require(:book).permit(:book_title, :book_body)
  end

end
