Rails.application.routes.draw do
  resources :plants
  root 'plants#index'
  #root 'plants#index'

  namespace :api do
    resources :plants
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
