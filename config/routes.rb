Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :users, only:[:show, :index, :edit, :update] do
    get 'follows' => 'relationships#follow_index'
    get 'followers' => 'relationships#follower_index'
  end
  	resources :books do
  		resources :book_comments, only:[:create, :destroy]
		resource :favorites, only:[:create, :destroy]
	end
	post 'follow/:id' => 'relationships#follow', as: 'follow'
	post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
