WifiK9::Application.routes.draw do

  devise_for :users

  root :to => 'pages#show', :id => 'dashboard'
end

