Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'posts#index'

  resources :users, only: %i[new create]
  resources :posts do
    resources :post_comments, only: %i[create edit update destroy]
    collection do
      get :search
    end
  end
  resource :profile, only: %i[new create show edit update]
  resources :spotify_tracks, only: %i[new create]
  get 'spotify_tracks/result', to: 'spotify_tracks#result', as: :spotify_track_result
  get 'spotify_tracks/search', to: 'spotify_tracks#search', as: :spotify_track_search

  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
end
