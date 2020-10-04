Rails.application.routes.draw do
  root to: "toppages#index"
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create, :edit, :update]  do
    member do
      get :blockings
      get :blockers
    end
  end
  
  resources :recommendeds, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
