Rails.application.routes.draw do
  get 'diagnostics/index'
  get 'diagnostics/show'
  get 'diagnostics/result'
  root "static_pages#top"
  resources :users, only: %i[new create]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
