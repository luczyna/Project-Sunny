Rails.application.routes.draw do
  root 'welcome#index'

  get 'signup' => 'users#new', :as => 'sign_up'
  get 'login'  => 'sessions#new', :as => 'log_in'
  get 'logout' => 'sessions#destroy', :as => 'log_out'
  resources :users
  resources :sessions
  resources :ideas do
    put :publish
  end

  post 'upvote/:version' => 'upvotes#create', :as => 'cast_vote'
  delete 'upvote/:vote/:idea' => 'upvotes#destroy', :as => 'remove_vote'
  post 'update-vote/:vote/:version' => 'upvotes#update', :as => 'update_vote'

  get 'dashboard' => 'dashboard#index'
end
