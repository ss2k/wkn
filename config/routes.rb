WifiK9::Application.routes.draw do
  resources :hotspots do
    resources :editorships, :only => [:create, :destroy, :index]
    resources :landings, :only => [:create, :destroy, :edit, :new, :update, :show]
  end

  devise_for :users
  root :to => 'hotspots#index'

  match '/:id', :to => 'hotspots#display'
  match '/:publication', :to => 'publications#show'
end

