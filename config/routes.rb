WifiK9::Application.routes.draw do
  resources :hotspots do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :new]
  end

  devise_for :users
  root :to => 'hotspots#index'

  match '/:publication', :to => 'publications#show'
end

