Rails.application.routes.draw do
  get 'instruments/owned'
  devise_for :users
  root to: 'pages#home'
  resources :instruments

  resources :instruments do
    resources :rents, only: [:create, :new]
  end

  resources :users do
    resources :rents, only: [:show, :index, :edit, :update]
  end

  resources :rents, only: [:destroy]
  # resources :users do
  #   resources :instruments, only: :index
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
