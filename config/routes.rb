WifiK9::Application.routes.draw do
  resources :hotspots, :only => [:create, :new, :show] do
    resources :landings, :only => [:create, :new]
  end

  resources :editorships, :only => :create

  devise_for :users
  root :to => 'hotspots#index'

  match '/:publication', :to => 'publications#show'
end

