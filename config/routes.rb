Rails.application.routes.draw do

  resources :companies
  root to: 'receipts#index'

  devise_for :users

  resources :users
  resources :receipts
  resources :products

end
