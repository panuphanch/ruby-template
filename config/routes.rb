Rails.application.routes.draw do
  get 'dashboard/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_scope :user do
    root :to => 'users/sessions#new'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :home
  resources :users

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
