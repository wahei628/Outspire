Rails.application.routes.draw do
  root "static_pages#top"
  resources :users, only: %i[new create]

  resources :diagnostics, only: %i[show index] do
    collection do
      post 'result'
    end
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
