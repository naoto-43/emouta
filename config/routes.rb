Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"

  resources :users, only: %i[new create]
  resources :posts
  resource :profile, only: %i[new create show edit update]
  resources :spotify_tracks, only: %i[new create]
  get 'spotify_tracks/result', to: 'spotify_tracks#result', as: :spotify_track_result
  get 'search/artists', to: 'search#artists', as: :search_artists
  get 'search/tracks', to: 'search#tracks', as: :search_tracks
end
