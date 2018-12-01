Rails.application.routes.draw do

  root to: "recipes#index"
  resources :recipes, :ingredients

  resources :chapters, only: [:show] do 
    resources :recipes, only: [:show]
  end  

  resources :recipes, only: [:show] do 
    resources :ingredients, only: [:new, :index, :create] 
  end

  get '/dinners', to: 'recipes#dinner'

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
