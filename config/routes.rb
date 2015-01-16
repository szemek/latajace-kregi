Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  post 'users/check'

  localized do
    root 'landing#index'
    get 'dashboard' => 'dashboard#index'

    resource :profile, only: [:edit, :update]

    resources :circles, only: [:index, :show]

    resources :events, only: [:show] do
      resources :rsvps, only: [:create, :destroy]
    end

    resources :heroines, only: [:index, :show]
    resources :organizers, only: [:index, :show]
    resources :people, only: [:index, :show]
  end

  namespace :api do
    post 'users/check'

    devise_scope :user do
      post 'users/sign_in' => 'sessions#create'
      post 'users' => 'registrations#create'
    end
  end

  resources :tags
end
