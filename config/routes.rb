Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/new'
  get 'sessions/log_in'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create show]
  resources :sessions
  root "users#new"
end
