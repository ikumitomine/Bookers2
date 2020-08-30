Rails.application.routes.draw do

  devise_for :users
  resources :users, only:[:show, :index, :edit, :update]
  # get 'home/about'
  root to: 'home#top'
  resources :books

end
