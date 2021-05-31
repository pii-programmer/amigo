Rails.application.routes.draw do
  devise_for :users
  root to: 'chats#index'
  resources :chats ,only: [:index, :create]
end
