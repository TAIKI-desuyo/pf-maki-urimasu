Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  post "makiis/rate" => "makiis#rate"
  resources :makiis do
  resources :comments, only: [:create, :destroy]
  resource :book_marks, only: [:create, :destroy,]
  end
   get "book_marks/index" => "book_marks#index"
    resources :notifications, only: :index
end
