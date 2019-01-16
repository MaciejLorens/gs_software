Rails.application.routes.draw do

  patch 'locale/set'

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :settings, only: [:index] do
    put :refresh_token, on: :collection
    put :set_qr_code_size, on: :collection
  end

  resources :admins, except: [:show] do
    get :invitations, on: :collection

    patch :resend, on: :member

    post :invite, on: :collection

    delete :invitation_destroy, on: :member
    delete :batch_destroy, on: :collection
  end

  resources :users, except: [:show] do
    get :invitations, on: :collection

    patch :resend, on: :member

    post :invite, on: :collection

    delete :invitation_destroy, on: :member
    delete :batch_destroy, on: :collection
  end

  resources :notifies do
    get :pdf, on: :member
    get :generate_pdf, on: :member
    delete :batch_destroy, on: :collection
  end

  resources :clients, except: [:show] do
    delete :batch_destroy, on: :collection
  end

  resources :products, except: [:show] do
    delete :batch_destroy, on: :collection
  end

  resources :drivers, except: [:show] do
    delete :batch_destroy, on: :collection
  end

  resources :companies, except: [:show] do
    delete :batch_destroy, on: :collection
  end

  namespace :api do
    namespace :v1 do
      get 'notifies/show'
    end
  end

  root to: 'notifies#index'

end
