class SearchesController < ApplicationController
	def search
		@book = Book.new
		@book_n = Book.new
		@user_or_book = params[:option]
		@search_method = params[:search_method]
		@search = params[:search]
		if @user_or_book == "1"
			@users = User.search(params[:search], @search_method, @user_or_book)
		else
			@books = Book.search(params[:search], @search_method, @user_or_book)
		end
	end

	def show
		@user_or_book = params[:option]
		@search_method = params[:search_method]
		# @search = params[:search]
		if @user_or_book == "1"
			@users = User.search(params[:search], @search_method, @user_or_book)
		else
			@books = Book.search(params[:search], @search_method, @user_or_book)
		end
	end
end
