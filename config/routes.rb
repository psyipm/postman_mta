PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create]
  resources :conversations, only: [:index, :show]
  resources :labels, only: [:create, :destroy]
  resources :tags, only: [:create, :destroy]
end
