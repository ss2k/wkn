WifiK9::Application.routes.draw do

  devise_for :users

  root :to => 'hotspots#index'

  resources :hotspots, :only => [:create, :new, :show]

  resources :landings, :only => [:create, :new]
end

