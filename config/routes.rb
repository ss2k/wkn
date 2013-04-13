WifiK9::Application.routes.draw do

  devise_for :users

  root :to => 'hotspots#index'

  resources :hotspots, :only => [:create, :index, :new]
end

