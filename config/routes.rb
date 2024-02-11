Rails.application.routes.draw do
  devise_for :users

  # Deviseのログアウトルートを追加
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # 他のルート
  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"

  resources :users, only: %i[new create]
  resources :posts
  resource :profile, only: %i[new create show edit update]
  resources :spotify_tracks, only: %i[new create]
end
