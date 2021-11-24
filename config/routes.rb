Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/destroy'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  post "makiis/rate" => "makiis#rate"
  resources :makiis do
    resources :reviews, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resource :book_marks, only: [:create, :destroy]
  end
  get "book_marks/index" => "book_marks#index"
  resources :notifications, only: :index
  delete "notifications" => "notifications#destroy_all", as: "notifications_destroy_all"

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
end
