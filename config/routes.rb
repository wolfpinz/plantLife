Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :garden, only: [:show, :new, :create, :destroy] do
    resources :my_plant, only: [:show, :new, :create, :edit, :update, :destroy]
  end
end
