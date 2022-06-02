Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :my_plants, only: [] do
    member do
      patch :water
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gardens, only: [:show, :new, :create, :destroy] do
    resources :plants, only: [:index]
    resources :my_plants, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  resources :plants, only: [:new, :create]
end
