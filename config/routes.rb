Rails.application.routes.draw do

  get 'admin/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :companies

  devise_for :users

  resources :users, except: [:create] do
    post 'create_user' => 'users#create', on: :collection
  end
  resources :receipts
  resources :products
  resources :drivers

  root to: 'receipts#index'

end
