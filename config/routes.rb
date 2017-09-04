PostmanMta::Engine.routes.draw do
  resources :messages, only: [:show, :create]

  resources :conversations, only: [:index, :show] do
    [:inbox, :sent, :spam, :trash].each do |folder|
      match folder, on: :collection, via: :get
    end

    match :read, on: :collection, via: [:put, :patch]
    match :move_to_trash, on: :member, via: :delete

    resources :labels, only: [:create, :destroy]
    resources :tags, only: [:create, :destroy]
  end
end
