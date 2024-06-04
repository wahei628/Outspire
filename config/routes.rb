Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "static_pages#top"
  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]

  resources :diagnostics, only: %i[show index] do
    collection do
      post 'result'
      get 'show_result', to: 'diagnostics#show_result'
    end
  end

  get 'places/search', to: 'places#search'

  get 'weather', to: 'weather#index', as: :weather
  get 'weather/show', to: 'weather#show', as: :show_weather

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
