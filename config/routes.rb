WifiK9::Application.routes.draw do
  resources :hotspots do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :edit, :new, :update]
  end

  devise_for :users
  root :to => 'hotspots#index'

  match '/:publication', :to => 'publications#show'
end

