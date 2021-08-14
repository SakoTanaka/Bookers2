Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'top' => 'homes#top'
  get 'about' => 'about#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
end
  resources :users, only: [:show, :edit, :update, :index]
end