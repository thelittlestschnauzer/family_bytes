Rails.application.routes.draw do

  
  resources :chapters, only: [:show] do 
    resources :recipes, only: [:new, :show, :index, :edit] 
  end
  
  resources :recipes, only: [:index, :show, :new, :create, :update]

  root to: 'home#index'

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
