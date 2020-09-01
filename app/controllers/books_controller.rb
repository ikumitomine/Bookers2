class BooksController < ApplicationController
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
	    if @book.save
		   flash[:notice] = "You have creatad book successfully."
		   redirect_to book_path(@book)
		 else
		   render "index"
	    end
	end

	def index
		@books = Book.all
		@book_n = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_n = Book.new
	end

	def edit
  		@book = Book.find(params[:id])
    end

    def update
  		@book= Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice_e] = "You have updated book successfully."
        redirect_to book_path(@book.id)
     else
       render action: :edit
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

	private
    def book_params
     params.require(:book).permit(:title, :body, :profile_image_id,)
    end

end
