Rails.application.routes.draw do

  root to: "chapters#index"

  
  resources :chapters do 
    resources :recipes, only: [:show, :index]
  end  
  
  resources :chapters do 
    collection do    
      match 'search' => 'people#search', via: [:get, :post], as: :search
    end     
  end 

  resources :recipes
  
  
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
