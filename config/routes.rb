PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create]

  resources :conversations, only: [:index, :show, :destroy] do
    [:inbox, :sent, :spam, :trash].each do |folder|
      match folder, on: :collection, via: :get
    end

    match :read, on: :collection, via: [:put, :patch]

    resources :labels, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  resources :routes, only: :index
end
