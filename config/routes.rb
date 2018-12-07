Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations'}

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

  root to: 'notifies#index'

end
