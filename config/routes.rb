WifiK9::Application.routes.draw do
  get "dashboard/index"

  namespace :admin do
    root :to => 'dashboard#index'
  end
  resources :hotspots do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :destroy, :edit, :new, :update, :show]
  end

  devise_for :users
  root :to => 'hotspots#index'

  match '/:id', :to => 'hotspots#display'
  match '/:publication', :to => 'publications#show'
end

