Rails.application.routes.draw do

  root to: "chapters#index"

  resources :chapters do 
    resources :recipes, only: [:new, :show, :index]
  end  

  get 'recipes/search', to: 'recipes#search'
  
  get 'ingredients', to: 'ingredients#index'
  
  resources :recipes
  
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login' 
  get 'logout', to: 'sessions#destroy', as: 'logout'  
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
