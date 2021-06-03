Rails.application.routes.draw do
  devise_for :users
  root to: 'chats#introduce'
  resources :chats, only: [:index, :create] do
    collection do
      get 'introduce'
    end
  end
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: :show
end
