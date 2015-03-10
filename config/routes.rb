Rails.application.routes.draw do
  root 'members#index'

  devise_for :users, :controllers => {
    :registrations => 'registrations'
  }
  ActiveAdmin.routes(self)

  post 'users/check'

  get 'faq' => 'faq#show'

  localized do
    resource :profile, only: [:edit, :update]

    resources :circles, only: [:index, :show]

    resources :events, only: [:show] do
      resources :rsvps, only: [:create, :destroy]
    end

    resources :heroines, only: [:index, :show]
    resources :organizers, only: [:index, :show]
    resources :members, only: [:index, :show] do
      post :index, on: :collection
    end
  end

  namespace :api do
    post 'users/check'

    devise_scope :user do
      post 'users/sign_in' => 'sessions#create'
      post 'users' => 'registrations#create'
      post 'users/password' => 'passwords#create'
      put 'users/password' => 'passwords#update'
    end

    resources :tags, only: [:index]

    resources :hooks, only: [] do
      post :email, on: :collection
    end
  end

  resources :tags
  resource :feedback do
    get :thanks
  end

  get 'status' => 'status#check'

  match '*path', to: redirect('/'), via: [:get, :post]
end
