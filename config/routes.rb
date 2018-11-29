Rails.application.routes.draw do

  get 'chapters/:id/recipes', to: 'chapters#recipes_index'
  get 'chapters/:id/recipes/:recipe_id', to: 'chapters#recipe'

  resources :chapters, only: [:show, :index] do 
    resources :recipes, only: [:show, :new, :edit] 
  end
  
  resources :recipes, only: [:index, :create, :edit, :update]

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
