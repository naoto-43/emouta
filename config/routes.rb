Rails.application.routes.draw do
  # 既存のルート
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # Deviseのログアウトルートを追加
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  # 他のルート
  get "up" => "rails/health#show", as: :rails_health_check
  root "posts#index"

  resources :users, only: %i[new create]
  resources :boards, only: %i[index new create]
end
