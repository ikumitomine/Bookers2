class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]


	def create
		@book_n = Book.new(book_params)
		@book_n.user_id = current_user.id
	    if @book_n.save
		   flash[:notice] = "You have created book successfully."
		   redirect_to book_path(@book_n)
		 else
		   @books = Book.all
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
		@book_comment = BookComment.new
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

    private
	def correct_user
		book = Book.find(params[:id])
		  if current_user.id != book.user_id
			redirect_to books_path
		  end
	end

end
