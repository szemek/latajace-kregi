Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  localized do
    root 'dashboard#index'

    resource :profile, only: [:edit, :update]

    resources :circles, only: [:show]

    resources :events, only: [:show] do
      resources :rsvps, only: [:create, :destroy]
    end

    resources :heroines, only: [:index, :show]
    resources :organizers, only: [:index, :show]
    resources :people, only: [:index, :show]
  end

  resources :tags
end
