Rails.application.routes.draw do

  root to: "chapters#index"

  resources :chapters do 
    resources :recipes, only: [:new, :show, :index]
  end  

  get 'recipes/search', to: 'recipes#search'
  
  get 'ingredients', to: 'ingredients#index'
  
  resources :recipes
  
  get 'signup', to: 'users#new', as: 'signup'

  resources :users 

  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy', as: 'logout'  
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
