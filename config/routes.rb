Rails.application.routes.draw do
  root to: "top#index" 
  devise_for :users
  resources :books
  resources :top, only:[:index]
  resources :about, only:[:index]
  resources :users, only:[:index,:show,:edit,:update]
  resources :book_comments, only:[:index,:create,:edit,:destroy,:update]
  resources :favorites, only:[:index,:create,:destroy]

end
