Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  # devise_for :users
  # devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  # devise_scope :user do 
  #   get 'login', to: 'devise/sessions#new'
  #   get 'signup', to: 'devise/registrations#new'
  # end 

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  resources :exercises, only: [:new, :create, :index, :show, :update, :destroy, :edit]

  resources :coaches do 
    resources :exercises, only: [:index]
  end 

end
