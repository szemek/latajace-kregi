Rails.application.routes.draw do
  root 'landing#index'

  devise_for :users
  ActiveAdmin.routes(self)

  post 'users/check'

  localized do
    get 'people' => 'people#index', as: :start

    resource :profile, only: [:edit, :update]

    resources :circles, only: [:index, :show]

    resources :events, only: [:show] do
      resources :rsvps, only: [:create, :destroy]
    end

    resources :heroines, only: [:index, :show]
    resources :organizers, only: [:index, :show]
    resources :people, only: [:index, :show] do
      post :index, on: :collection
    end
  end

  namespace :api do
    post 'users/check'

    devise_scope :user do
      post 'users/sign_in' => 'sessions#create'
      post 'users' => 'registrations#create'
    end

    resources :tags, only: [:index]
  end

  resources :tags
  resource :feedback do
    get :thanks
  end
end
