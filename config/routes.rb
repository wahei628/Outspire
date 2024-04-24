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

  resource :profile, only: %i[show edit update]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get "up" => "rails/health#show", as: :rails_health_check

end
