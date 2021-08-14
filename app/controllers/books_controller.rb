class BooksController < ApplicationController

  def show
   @newbook = Book.new
   @book = Book.find(params[:id])
   @user = @book.user
  end

  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
  if @book.save
   flash[:notice] = "Book was successfully created."
   redirect_to book_path(@book)
  else
   @user = current_user
   @books = Book.all
   render:show
  end
  end

  def edit
   @book = Book.find(params[:id])
  if @book.user = current_user
   render "edit"
  else
   redirect_to books_path
  end

  def update
   @book = Book.find(params[:id])
   @book.user_id = current_user
  if @book.update(book_params)
   flash[:notice] = "Book was successfully updated."
   redirect_to book_path(@book.id)
  else
   render:edit
  end
  end

  def destroy
   @book = Book.find(params[:id])
   if @book.destroy
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path
  end
  end

private
 def book_params
  params.require(:book).permit(:title, :body)
 end

end
