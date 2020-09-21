class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: { maximum: 200 }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def Book.search(search, search_method, user_or_book)
	    if user_or_book == "2"
	      if search_method == "perfect_match"
	        @books = Book.where(title: "#{search}")
	      elsif search_method == "forward_match"
	        @books = Book.where("title LIKE?","#{search}%")
	      elsif search_method == "backward_match"
	        @books = Book.where("title LIKE?","%#{search}")
	      else search_method == "pertial_match"
	        @books = Book.where("title LIKE?","%#{search}%")
	      end
	    end
 	end
end
