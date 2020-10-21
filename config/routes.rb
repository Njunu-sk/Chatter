Rails.application.routes.draw do
  resources :events
  devise_for :users

  root 'pages#index'

  resources :songs do
    resources :comments, only: [:index, :create]
  end
  
  get 'search', to: "songs#search"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
