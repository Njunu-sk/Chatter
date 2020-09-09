Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'

  resources :songs do
    resources :comments, only: [:index, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
