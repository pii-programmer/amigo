Rails.application.routes.draw do
  get 'chats/index'
  #resources :chats ,only: :show
end
