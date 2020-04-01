Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    # get "/home", to: "devise/sessions#new"
    # post "users/sign_up", to: "devise/sessions#create"
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  resources :users 
  resources :exercises, only: [:new, :create, :index, :show, :update, :destroy, :edit]

  resources :coaches do 
    resources :exercises, only: [:new, :index, :show, :edit]
  end 

end
