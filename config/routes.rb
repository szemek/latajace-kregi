Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'dashboard#index'

  resources :circles, only: [:show], path: 'latajace-kregi'

  resources :events, only: [:show], path: 'wydarzenia' do
    resources :rsvps, only: [:create, :destroy]
  end

  scope(path_names: { edit: 'edycja' }) do
    resource :profile, path: 'profil'
  end

  resources :people, only: [:index, :show], path: 'kregowiczki'
  resources :heroines, only: [:index, :show], path: 'bohaterki'
  resources :organizers, only: [:index, :show], path: 'organizatorki'
end
