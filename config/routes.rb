WifiK9::Application.routes.draw do
  resources :hotspots, :only => [:create, :new, :show] do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :new]
  end

  devise_for :users
  root :to => 'hotspots#index'

  match '/:publication', :to => 'publications#show'
end

