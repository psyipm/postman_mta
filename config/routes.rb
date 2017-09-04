PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create]

  resources :conversations, only: [:index, :show] do
    match :read, on: :collection, via: [:put, :patch]

    resources :labels, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end
end
