Rails.application.routes.draw do

  root to: "chapters#index"

  
  resources :chapters do 
    resources :recipes, only: [:show, :index]
  end  
  get 'recipes/search', to: 'recipes#search'
  resources :searches 
  
  resources :recipes
  get '/chapters/:id/recipes/search', to: "recipes#search"
  
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
