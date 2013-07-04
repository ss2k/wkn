WifiK9::Application.routes.draw do
  get "dashboard/index"

  resources :suspensions, :only => [:new, :destroy]

  namespace :admin do
    root :to => 'dashboard#index'
  end
  resources :hotspots do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :destroy, :edit, :new, :update, :show]
  end

  devise_for :users, :path => 'accounts'
  
  resources :users do
    resources :tickets 
  end

  resources :tickets do
    resources :responses
  end
  root :to => 'hotspots#index'

  match 'suspension/:id', :to => 'admin/dashboard#suspend_user', :as => 'suspension'
  match '/:id', :to => 'hotspots#display'
  match '/:publication', :to => 'publications#show'
end

