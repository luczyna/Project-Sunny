Rails.application.routes.draw do
  root 'welcome#index'

  get 'signup' => 'users#new', :as => 'sign_up'
  get 'login'  => 'sessions#new', :as => 'log_in'
  get 'logout' => 'sessions#destroy', :as => 'log_out'
  resources :users
  resources :sessions

  get 'dashboard' => 'dashboard#index'
end
