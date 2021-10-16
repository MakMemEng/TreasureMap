Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
  }
  namespace :admins do
    resources :users, only: %i(index destroy)
    resources :affirmations, only: %i(index destroy)
  end
  devise_for :users
  root to: "home#index"
  resources :users
  resources :affirmations
end
