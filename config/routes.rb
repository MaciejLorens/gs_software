Rails.application.routes.draw do

  get 'admin/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  resources :users, except: [:create] do
    post 'create_user' => 'users#create', on: :collection
    delete :batch_destroy, on: :collection
  end

  resources :receipts do
    get :search, on: :collection
    delete :batch_destroy, on: :collection
  end

  resources :products do
    delete :batch_destroy, on: :collection
  end

  resources :drivers do
    delete :batch_destroy, on: :collection
  end

  resources :companies do
    delete :batch_destroy, on: :collection
  end

  root to: 'receipts#index'

end
