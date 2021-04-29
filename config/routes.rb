PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create], param: :token do
    resources :attachments, only: :show, param: :uuid
  end

  resources :conversations, only: [:index, :show, :destroy] do
    [:inbox, :sent, :spam, :trash].each do |folder|
      match folder, on: :collection, via: :get
    end

    match :starred, on: :collection, via: :get, to: 'conversations#index'
    match :search, on: :collection, via: :get
    match :read, on: :collection, via: [:put, :patch]
    match :unread, on: :collection, via: [:put, :patch]
    match :move, on: :collection, via: [:put, :patch]

    resources :labels, only: [:create, :update, :destroy]
    resources :tags, only: [:create, :destroy]
  end

  namespace :stats do
    resources :messages, only: [] do
      match :unread, on: :collection, via: :get
    end
  end

  namespace :archive do
    resources :conversations, only: [:index, :show] do
      match :move, on: :collection, via: [:put, :patch]
    end
  end

  resources :routes, only: :index
  resources :domains, only: :index
  resources :labels, only: :index
  resources :notes, only: [:create, :update]
end
