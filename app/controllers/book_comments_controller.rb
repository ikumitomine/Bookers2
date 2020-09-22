class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@book_comments = @book.book_comments
		comment = current_user.book_comments.build(book_comment_params)
		comment.book_id = @book.id
		if comment.save
			flash[:success] = "Comment was successfully created"
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
		@book_comments = @book.book_comments
	end

	private
    def book_comment_params
     params.require(:book_comment).permit(:comment)
    end

end
