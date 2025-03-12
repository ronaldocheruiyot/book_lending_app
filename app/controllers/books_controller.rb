class BooksController < ApplicationController
  before_action :authenticate_user!, only: [ :borrow, :return ]
  before_action :set_book, only: [ :show, :borrow, :return ]

  def index
    @books = Book.all
  end

  def show
  end

  def borrow
    if @book.available?
      current_user.borrowings.create!(book: @book, due_date: 2.weeks.from_now)
      redirect_to books_path, notice: "Book borrowed successfully."
    else
      redirect_to books_path, alert: "Book is not available."
    end
  end

  def return
    borrowing = current_user.borrowings.find_by(book: @book, returned_at: nil)
    if borrowing
      borrowing.update!(returned_at: Time.current)
      redirect_to books_path, notice: "Book returned successfully."
    else
      redirect_to books_path, alert: "You have not borrowed this book."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end
end
