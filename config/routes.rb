PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create], param: :token

  resources :conversations, only: [:index, :show, :destroy] do
    [:inbox, :sent, :spam, :trash].each do |folder|
      match folder, on: :collection, via: :get
    end

    match :starred, on: :collection, via: :get, to: 'conversations#index'
    match :read, on: :collection, via: [:put, :patch]
    match :unread, on: :collection, via: [:put, :patch]
    match :move, on: :collection, via: [:put, :patch]

    resources :labels, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  namespace :stats do
    resources :messages, only: [] do
      match :unread, on: :collection, via: :get
    end
  end

  resources :routes, only: :index
end
